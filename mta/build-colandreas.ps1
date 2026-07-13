[CmdletBinding()]
param(
    [string]$VcpkgRoot = $env:VCPKG_ROOT,
    [string]$OutputDirectory = (Join-Path $PSScriptRoot "artifacts\colandreas")
)

$ErrorActionPreference = "Stop"
$Source = Join-Path $PSScriptRoot "vendor\colandreas"
$Build = Join-Path $env:TEMP "mrp-colandreas-build"
$Toolchain = Join-Path $VcpkgRoot "scripts\buildsystems\vcpkg.cmake"

if (-not $VcpkgRoot) {
    throw "Podaj -VcpkgRoot albo ustaw VCPKG_ROOT."
}
if (-not (Test-Path (Join-Path $VcpkgRoot "vcpkg.exe"))) {
    throw "Nie znaleziono vcpkg.exe w $VcpkgRoot"
}
if (Test-Path $Build) { Remove-Item -Recurse -Force $Build }
New-Item -ItemType Directory -Force $Build | Out-Null
New-Item -ItemType Directory -Force $OutputDirectory | Out-Null

& (Join-Path $VcpkgRoot "vcpkg.exe") install bullet3:x86-windows-static
if ($LASTEXITCODE -ne 0) { throw "Nie udało się zbudować Bullet x86." }

cmake -S $Source -B $Build -A Win32 `
    "-DCMAKE_TOOLCHAIN_FILE=$Toolchain" `
    "-DCMAKE_POLICY_VERSION_MINIMUM=3.5" `
    -DVCPKG_TARGET_TRIPLET=x86-windows-static `
    -DBuildWizard=OFF
if ($LASTEXITCODE -ne 0) { throw "Konfiguracja ColAndreas nie powiodła się." }

cmake --build $Build --config Release
if ($LASTEXITCODE -ne 0) { throw "Kompilacja ColAndreas nie powiodła się." }

$Dll = Get-ChildItem $Build -Filter "ColAndreas.dll" -Recurse | Select-Object -First 1
if (-not $Dll) { throw "Build nie utworzył ColAndreas.dll." }
Copy-Item $Dll.FullName (Join-Path $OutputDirectory "ColAndreas.dll") -Force
Get-FileHash -Algorithm SHA256 (Join-Path $OutputDirectory "ColAndreas.dll")
