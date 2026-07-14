[CmdletBinding()]
param(
    [string]$OutputDirectory = (Join-Path $PSScriptRoot "artifacts\amx")
)

$ErrorActionPreference = "Stop"
$Source = Join-Path $PSScriptRoot "vendor\mta-amx\amx-deps\src"
$Work = Join-Path $env:TEMP "mrp-amx-module-build"
$BuildSource = Join-Path $Work "src"
$PremakeUrl = "https://github.com/premake/premake-core/releases/download/v5.0.0-beta8/premake-5.0.0-beta8-windows.zip"
$PremakeSha256 = "e64ce2ed8778e0098f63674cca61fe33941b5f0c8d9a4afd651152bdea3758ab"

if (-not (Test-Path $Source)) { throw "Brak źródeł modułu MTA AMX: $Source" }
if (Test-Path $Work) { Remove-Item -Recurse -Force $Work }
New-Item -ItemType Directory -Force $BuildSource | Out-Null
New-Item -ItemType Directory -Force $OutputDirectory | Out-Null
Copy-Item -Path (Join-Path $Source "*") -Destination $BuildSource -Recurse -Force

$PremakeZip = Join-Path $Work "premake.zip"
& curl.exe --fail --location --silent --show-error --connect-timeout 30 --max-time 300 `
    --output $PremakeZip $PremakeUrl
if ($LASTEXITCODE -ne 0) { throw "Nie udało się pobrać przypiętego Premake." }
$ActualHash = (Get-FileHash -Algorithm SHA256 $PremakeZip).Hash.ToLowerInvariant()
if ($ActualHash -ne $PremakeSha256) {
    throw "Niepoprawna suma SHA-256 Premake: $ActualHash"
}
Expand-Archive -Path $PremakeZip -DestinationPath $Work -Force

Push-Location $BuildSource
try {
    & (Join-Path $Work "premake5.exe") --file=premake5.lua vs2022
    if ($LASTEXITCODE -ne 0) { throw "Generowanie projektu king.dll nie powiodło się." }
} finally {
    Pop-Location
}

$VsWhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
if (-not (Test-Path $VsWhere)) { throw "Nie znaleziono vswhere.exe." }
$MsBuild = & $VsWhere -latest -products * -requires Microsoft.Component.MSBuild `
    -find MSBuild\**\Bin\MSBuild.exe | Select-Object -First 1
if (-not $MsBuild) { throw "Nie znaleziono MSBuild.exe." }

& $MsBuild (Join-Path $BuildSource "Build\king.sln") /m `
    /p:Configuration=Release /p:Platform=Win32
if ($LASTEXITCODE -ne 0) { throw "Kompilacja king.dll nie powiodła się." }

$Dll = Get-ChildItem $BuildSource -Filter "king.dll" -Recurse | Select-Object -First 1
if (-not $Dll) { throw "Build nie utworzył king.dll." }
$Destination = Join-Path $OutputDirectory "king.dll"
Copy-Item $Dll.FullName $Destination -Force
Get-FileHash -Algorithm SHA256 $Destination
