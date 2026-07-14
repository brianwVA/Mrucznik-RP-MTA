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

