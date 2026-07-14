[CmdletBinding()]
param(
    [string]$InstallRoot = "C:\Mrucznik-RP-MTA",
    [switch]$MysqlOnly,
    [switch]$Wait
)

$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot "WindowsHelpers.ps1")
$State = Get-MrpInstallState -InstallRoot $InstallRoot
Start-MrpMysql -State $State

if ($MysqlOnly) {
    Write-Host "MySQL działa na 127.0.0.1:$($State.mysqlPort)."
    exit 0
}

$ServerExe = Join-Path $State.serverRoot "MTA Server.exe"
$AlreadyRunning = Get-CimInstance Win32_Process -Filter "Name='MTA Server.exe'" `
    -ErrorAction SilentlyContinue | Where-Object { $_.ExecutablePath -eq $ServerExe }
if ($AlreadyRunning) {
    Write-Host "Serwer MTA już działa (PID $($AlreadyRunning.ProcessId -join ', '))."
    exit 0
}

$Process = Start-Process $ServerExe -WorkingDirectory $State.serverRoot -PassThru
Set-Content (Join-Path $InstallRoot "mta.pid") $Process.Id -Encoding ASCII
Write-Host "Mrucznik RP MTA uruchomiony (PID $($Process.Id))."
Write-Host "Połącz się klientem MTA z: 127.0.0.1:22003"
Write-Host "Logi: $($State.serverRoot)\mods\deathmatch\logs"
if ($Wait) { Wait-Process -Id $Process.Id }

