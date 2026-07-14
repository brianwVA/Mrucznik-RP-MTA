[CmdletBinding()]
param(
    [string]$InstallRoot = "C:\Mrucznik-RP-MTA",
    [switch]$KeepMysql
)

$ErrorActionPreference = "Stop"
. (Join-Path $PSScriptRoot "WindowsHelpers.ps1")
$State = Get-MrpInstallState -InstallRoot $InstallRoot
$PidPath = Join-Path $InstallRoot "mta.pid"

if (Test-Path $PidPath) {
    $ServerPid = [int](Get-Content $PidPath -Raw)
    Stop-Process -Id $ServerPid -Force -ErrorAction SilentlyContinue
    Remove-Item $PidPath -Force -ErrorAction SilentlyContinue
}

# A stale PID file must not leave an older server instance holding modules or
# the UDP port. Always clean up processes belonging to this installation only.
Get-CimInstance Win32_Process -Filter "Name='MTA Server.exe'" `
    -ErrorAction SilentlyContinue |
    Where-Object { $_.ExecutablePath -eq (Join-Path $State.serverRoot "MTA Server.exe") } |
    ForEach-Object { Stop-Process -Id $_.ProcessId -Force }

if (-not $KeepMysql) { Stop-MrpMysql -State $State }
Write-Host "Mrucznik RP MTA zatrzymany."
$global:LASTEXITCODE = 0
return
