[CmdletBinding()]
param(
    [string]$InstallRoot = $PSScriptRoot,
    [switch]$MysqlOnly,
    [switch]$Wait
)

$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot "WindowsHelpers.ps1")
$State = Get-MrpInstallState -InstallRoot $InstallRoot
Start-MrpMysql -State $State
Repair-MrpModelManifest -State $State

if ($MysqlOnly) {
    Write-Host "MySQL działa na 127.0.0.1:$($State.mysqlPort)."
    $global:LASTEXITCODE = 0
    return
}

$ServerExe = Join-Path $State.serverRoot "MTA Server.exe"
$AlreadyRunning = Get-CimInstance Win32_Process -Filter "Name='MTA Server.exe'" `
    -ErrorAction SilentlyContinue | Where-Object { $_.ExecutablePath -eq $ServerExe }
if ($AlreadyRunning) {
    Write-Host "Serwer MTA już działa (PID $($AlreadyRunning.ProcessId -join ', '))."
    $global:LASTEXITCODE = 0
    return
}

$Process = Start-Process $ServerExe -WorkingDirectory $State.serverRoot -WindowStyle Hidden -PassThru
Set-Content (Join-Path $InstallRoot "mta.pid") $Process.Id -Encoding ASCII
Write-Host "M-RP MTA uruchomiony (PID $($Process.Id))."
Write-Host "Połącz się klientem MTA z: 127.0.0.1:22003"
Write-Host "Logi: $($State.serverRoot)\mods\deathmatch\logs"
if ($Wait) { Wait-Process -Id $Process.Id }
$global:LASTEXITCODE = 0
return
