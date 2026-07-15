[CmdletBinding()]
param(
    [string]$InstallRoot = $PSScriptRoot,
    [int]$StartupSeconds = 70
)

$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot "WindowsHelpers.ps1")
$State = Get-MrpInstallState -InstallRoot $InstallRoot
Start-MrpMysql -State $State
Repair-MrpModelManifest -State $State

$ModelsRoot = Join-Path $State.serverRoot "mods\deathmatch\resources\mrp_models"
$ModelsMetaPath = Join-Path $ModelsRoot "meta.xml"
[xml]$ModelsMeta = Get-Content $ModelsMetaPath
foreach ($Registry in @("shared/samp_objects.lua", "shared/vc_objects.lua")) {
    $Registered = @($ModelsMeta.meta.script | Where-Object { $_.src -eq $Registry }).Count -eq 1
    if (-not $Registered) { throw "Manifest modeli nie ładuje $Registry." }
}
$ManifestAssets = @{}
foreach ($FileNode in @($ModelsMeta.meta.file)) {
    $ManifestAssets[[string]$FileNode.src] = $true
}
foreach ($Asset in Get-ChildItem (Join-Path $ModelsRoot "assets") -File -Recurse) {
    $RelativePath = $Asset.FullName.Substring($ModelsRoot.Length + 1).Replace("\", "/")
    if (-not $ManifestAssets.ContainsKey($RelativePath)) {
        throw "Manifest modeli pomija plik klienta: $RelativePath"
    }
}

$ServerExe = Join-Path $State.serverRoot "MTA Server.exe"
$Running = Get-CimInstance Win32_Process -Filter "Name='MTA Server.exe'" `
    -ErrorAction SilentlyContinue | Where-Object { $_.ExecutablePath -eq $ServerExe }
if ($Running) { throw "Zatrzymaj działający serwer przed testem: .\Stop-MrucznikMTA.ps1 -KeepMysql" }

$StartInfo = [System.Diagnostics.ProcessStartInfo]::new()
$StartInfo.FileName = $ServerExe
$StartInfo.WorkingDirectory = $State.serverRoot
$StartInfo.UseShellExecute = $false
$StartInfo.RedirectStandardInput = $true
$StartInfo.RedirectStandardOutput = $true
$StartInfo.RedirectStandardError = $true
$Process = [System.Diagnostics.Process]::new()
$Process.StartInfo = $StartInfo
if (-not $Process.Start()) { throw "Nie udało się uruchomić MTA Server.exe." }
$Stdout = $Process.StandardOutput.ReadToEndAsync()
$Stderr = $Process.StandardError.ReadToEndAsync()

Start-Sleep -Seconds $StartupSeconds
if ($Process.HasExited) {
    throw "Serwer zakończył działanie przed końcem testu, kod: $($Process.ExitCode)."
}
$Process.StandardInput.WriteLine("shutdown")
if (-not $Process.WaitForExit(20000)) {
    $Process.Kill()
    $Process.WaitForExit()
}

$Output = $Stdout.Result + "`r`n" + $Stderr.Result
$LogRoot = Join-Path $InstallRoot "logs"
New-Item -ItemType Directory -Force $LogRoot | Out-Null
$ConsoleLog = Join-Path $LogRoot "mta-smoke-test.log"
Set-Content $ConsoleLog $Output -Encoding UTF8
$Combined = $Output
Get-ChildItem (Join-Path $State.serverRoot "mods\deathmatch\logs") -File `
    -ErrorAction SilentlyContinue | ForEach-Object {
        $Combined += "`r`n===== $($_.Name) =====`r`n" + (Get-Content $_.FullName -Raw)
    }

$Required = @(
    "Server started and is ready to accept connections!",
    "Loading 'Mrucznik-RP.amx'",
    "MYSQL: Polaczono sie z baza MySQL",
    "REDIS: Po",
    "Loading Map.",
    "Loaded Map.",
    "Wczytano 50 organizacji"
)
foreach ($Text in $Required) {
    if ($Combined -notmatch [regex]::Escape($Text)) { throw "Brak w logu: $Text" }
}
if ($Combined -match "FATAL ERROR MYSQL|cannot connect to redis|connect\(\) failure|Run time error [0-9]+|can't be loaded due to missing functions") {
    throw "Test wykrył krytyczny błąd runtime. Sprawdź $ConsoleLog."
}

Write-Host "TEST OK: pełny M-RP uruchomił się na MTA."
Write-Host "Log testu: $ConsoleLog"
$global:LASTEXITCODE = 0
return
