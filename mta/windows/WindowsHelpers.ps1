Set-StrictMode -Version 2.0

function Get-MrpInstallState {
    param([Parameter(Mandatory = $true)][string]$InstallRoot)

    $StatePath = Join-Path $InstallRoot "installation.json"
    if (-not (Test-Path $StatePath)) {
        throw "Nie znaleziono $StatePath. Najpierw uruchom Install-MrucznikMTA.ps1."
    }
    return Get-Content $StatePath -Raw | ConvertFrom-Json
}

function Test-MrpMysql {
    param([Parameter(Mandatory = $true)]$State)

    $MysqlAdmin = Join-Path $State.mysqlHome "bin\mysqladmin.exe"
    if (-not (Test-Path $MysqlAdmin)) { return $false }
    $PreviousErrorActionPreference = $ErrorActionPreference
    try {
        # An unavailable server is the expected state before startup. Windows
        # PowerShell 5.1 must not promote mysqladmin's stderr to a terminating
        # error; availability is determined solely by the native exit code.
        $ErrorActionPreference = "Continue"
        & $MysqlAdmin --protocol=TCP --host=127.0.0.1 --port=$($State.mysqlPort) `
            --user=root --connect-timeout=2 ping 2>$null | Out-Null
        return $LASTEXITCODE -eq 0
    }
    finally {
        $ErrorActionPreference = $PreviousErrorActionPreference
    }
}

function Start-MrpMysql {
    param([Parameter(Mandatory = $true)]$State)

    if (Test-MrpMysql -State $State) { return }

    $MysqlServer = Join-Path $State.mysqlHome "bin\mysqld.exe"
    $LogRoot = Join-Path $State.installRoot "logs"
    New-Item -ItemType Directory -Force $LogRoot | Out-Null
    $Arguments = @(
        "--standalone", "--console",
        "--basedir=$($State.mysqlHome)",
        "--datadir=$($State.mysqlData)",
        "--port=$($State.mysqlPort)",
        "--bind-address=127.0.0.1",
        "--default-authentication-plugin=mysql_native_password"
    )
    $Process = Start-Process $MysqlServer -ArgumentList $Arguments `
        -RedirectStandardOutput (Join-Path $LogRoot "mysql.out.log") `
        -RedirectStandardError (Join-Path $LogRoot "mysql.err.log") -PassThru
    Set-Content (Join-Path $State.installRoot "mysql.pid") $Process.Id -Encoding ASCII

    for ($Attempt = 0; $Attempt -lt 60; $Attempt++) {
        if (Test-MrpMysql -State $State) { return }
        if ($Process.HasExited) {
            throw "MySQL zakończył działanie. Sprawdź logs\mysql.err.log."
        }
        Start-Sleep -Seconds 1
    }
    throw "MySQL nie uruchomił się w ciągu 60 sekund."
}

function Stop-MrpMysql {
    param([Parameter(Mandatory = $true)]$State)

    if (-not (Test-MrpMysql -State $State)) { return }
    $MysqlAdmin = Join-Path $State.mysqlHome "bin\mysqladmin.exe"
    & $MysqlAdmin --protocol=TCP --host=127.0.0.1 --port=$($State.mysqlPort) `
        --user=root shutdown | Out-Null
    if ($LASTEXITCODE -ne 0) { throw "Nie udało się bezpiecznie zatrzymać MySQL." }
}

function Repair-MrpModelManifest {
    param([Parameter(Mandatory = $true)]$State)

    $ResourceRoot = Join-Path $State.serverRoot "mods\deathmatch\resources\mrp_models"
    $MetaPath = Join-Path $ResourceRoot "meta.xml"
    if (-not (Test-Path $MetaPath)) { return }

    [xml]$Meta = Get-Content $MetaPath
    $Changed = $false
    $RegistryScripts = @(
        "shared/kotnik_models.lua",
        "shared/samp_objects.lua",
        "shared/vc_objects.lua"
    )
    foreach ($RegistryScript in $RegistryScripts) {
        $RegistryPath = Join-Path $ResourceRoot $RegistryScript.Replace("/", "\")
        $HasRegistry = @($Meta.meta.script | Where-Object {
            $_.src -eq $RegistryScript
        }).Count -gt 0
        if (-not (Test-Path $RegistryPath) -or $HasRegistry) { continue }
        $ScriptNode = $Meta.CreateElement("script")
        $ScriptNode.SetAttribute("src", $RegistryScript)
        $ScriptNode.SetAttribute("type", "shared")
        $ScriptNode.SetAttribute("cache", "false")
        $BaseRegistryNode = @($Meta.meta.script | Where-Object {
            $_.src -eq "shared/registry.lua"
        }) | Select-Object -First 1
        if ($BaseRegistryNode) {
            [void]$Meta.meta.InsertAfter($ScriptNode, $BaseRegistryNode)
        } else {
            [void]$Meta.meta.AppendChild($ScriptNode)
        }
        $Changed = $true
    }

    $KnownFiles = @{}
    foreach ($FileNode in @($Meta.meta.file)) {
        $KnownFiles[[string]$FileNode.src] = $true
    }
    $AssetsRoot = Join-Path $ResourceRoot "assets"
    if (Test-Path $AssetsRoot) {
        foreach ($Asset in Get-ChildItem $AssetsRoot -File -Recurse | Sort-Object FullName) {
            $RelativePath = $Asset.FullName.Substring($ResourceRoot.Length + 1).Replace("\", "/")
            if ($KnownFiles.ContainsKey($RelativePath)) { continue }
            $FileNode = $Meta.CreateElement("file")
            $FileNode.SetAttribute("src", $RelativePath)
            [void]$Meta.meta.AppendChild($FileNode)
            $KnownFiles[$RelativePath] = $true
            $Changed = $true
        }
    }

    if ($Changed) {
        $Meta.Save($MetaPath)
        Write-Host "Naprawiono manifest modeli MTA ($($KnownFiles.Count) plików klienta)."
    }
}

