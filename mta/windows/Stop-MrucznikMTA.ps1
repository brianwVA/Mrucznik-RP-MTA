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
} else {
    Get-CimInstance Win32_Process -Filter "Name='MTA Server.exe'" `
        -ErrorAction SilentlyContinue |
        Where-Object { $_.ExecutablePath -eq (Join-Path $State.serverRoot "MTA Server.exe") } |
        ForEach-Object { Stop-Process -Id $_.ProcessId -Force }
}

if (-not $KeepMysql) { Stop-MrpMysql -State $State }
Write-Host "Mrucznik RP MTA zatrzymany."

