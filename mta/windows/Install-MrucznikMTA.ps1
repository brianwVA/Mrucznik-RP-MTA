[CmdletBinding()]
param(
    [string]$InstallRoot = "C:\Mrucznik-RP-MTA",
    [int]$MysqlPort = 3306,
    [switch]$SkipRuntimeTest
)

$ErrorActionPreference = "Stop"
Set-StrictMode -Version 2.0

$MtaUrl = "https://nightly.multitheftauto.com/mtasa-1.6-rc-24124-20260613.exe"
$MtaSha256 = "b58328e72922321de59531acd139ff829cfc29270108e000956b5a1bd7c928b1"
$MysqlUrl = "https://cdn.mysql.com/archives/mysql-5.7/mysql-5.7.44-winx64.zip"
$MysqlSha256 = "aed661fe8120254a1dc30f5a4d5de346681922f4847cf025e2d4084eca78e70e"
$SevenZipSha256 = "d64a0468f5b5b0b0fc5b2188450bcd655b70809d97b1c4535f2884635094377d"
$KingSha256 = "0d79740654407d8805e970fc6e4803db7bb6e9f8753d2d6c14244556adb10a88"
$ColAndreasSha256 = "bf188f7b9fd8be45cd21872a399cab9a0a82b6df55f620359bc4c38c2c7f0e57"

function Get-PackageLayout {
    $PackagedPayload = Join-Path $PSScriptRoot "payload"
    if (Test-Path (Join-Path $PackagedPayload "mta\setup.ps1")) {
        return @{
            Payload = $PackagedPayload
            Binaries = (Join-Path $PSScriptRoot "binaries")
        }
    }
    $RepositoryRoot = (Resolve-Path (Join-Path $PSScriptRoot "..\..")).Path
    return @{
        Payload = $RepositoryRoot
        Binaries = (Join-Path $PSScriptRoot "binaries")
    }
}

function Get-VerifiedFile {
    param(
        [Parameter(Mandatory = $true)][string]$Uri,
        [Parameter(Mandatory = $true)][string]$Destination,
        [Parameter(Mandatory = $true)][string]$Sha256
    )
    if (Test-Path $Destination) {
        $Existing = (Get-FileHash -Algorithm SHA256 $Destination).Hash.ToLowerInvariant()
        if ($Existing -eq $Sha256) { return }
        Remove-Item $Destination -Force
    }
    for ($Attempt = 1; $Attempt -le 6; $Attempt++) {
        Write-Host "Pobieranie $Uri (próba $Attempt/6)"
        & curl.exe --fail --location --silent --show-error --connect-timeout 30 `
            --max-time 900 --output $Destination $Uri
        if ($LASTEXITCODE -eq 0) {
            $Actual = (Get-FileHash -Algorithm SHA256 $Destination).Hash.ToLowerInvariant()
            if ($Actual -eq $Sha256) { return }
            throw "Niepoprawna suma SHA-256 $Destination`: $Actual"
        }
        Remove-Item $Destination -Force -ErrorAction SilentlyContinue
        if ($Attempt -lt 6) { Start-Sleep -Seconds ([Math]::Min($Attempt * 5, 20)) }
    }
    throw "Nie udało się pobrać $Uri."
}

function Invoke-MysqlFile {
    param(
        [Parameter(Mandatory = $true)][string]$MysqlExe,
        [Parameter(Mandatory = $true)][string]$File,
        [string]$Database = ""
    )
    $DatabaseArgument = if ($Database) { " $Database" } else { "" }
    $Command = "`"$MysqlExe`" --protocol=TCP -h127.0.0.1 -P$MysqlPort -uroot$DatabaseArgument < `"$File`""
    & cmd.exe /d /s /c $Command
    if ($LASTEXITCODE -ne 0) { throw "Import SQL nie powiódł się: $File" }
}

$Layout = Get-PackageLayout
$PayloadRoot = $Layout.Payload
$BinariesRoot = $Layout.Binaries
$RequiredPayload = @(
    (Join-Path $PayloadRoot "serverfiles.tar.gz"),
    (Join-Path $PayloadRoot "mta\setup.ps1"),
    (Join-Path $PayloadRoot "database\routines.sql"),
    (Join-Path $BinariesRoot "king.dll"),
    (Join-Path $BinariesRoot "ColAndreas.dll"),
    (Join-Path $BinariesRoot "7z2601-x64.exe")
)
foreach ($Path in $RequiredPayload) {
    if (-not (Test-Path $Path)) { throw "Paczka jest niekompletna, brak: $Path" }
}
if ((Get-FileHash -Algorithm SHA256 (Join-Path $BinariesRoot "king.dll")).Hash.ToLowerInvariant() -ne $KingSha256) {
    throw "Niepoprawny king.dll."
}
if ((Get-FileHash -Algorithm SHA256 (Join-Path $BinariesRoot "ColAndreas.dll")).Hash.ToLowerInvariant() -ne $ColAndreasSha256) {
    throw "Niepoprawny ColAndreas.dll."
}
if ((Get-FileHash -Algorithm SHA256 (Join-Path $BinariesRoot "7z2601-x64.exe")).Hash.ToLowerInvariant() -ne $SevenZipSha256) {
    throw "Niepoprawny instalator 7-Zip."
}

New-Item -ItemType Directory -Force $InstallRoot | Out-Null
$Downloads = Join-Path $InstallRoot "downloads"
New-Item -ItemType Directory -Force $Downloads | Out-Null

$SevenZipRoot = Join-Path $InstallRoot "tools\7zip"
$SevenZip = Join-Path $SevenZipRoot "7z.exe"
if (-not (Test-Path $SevenZip)) {
    New-Item -ItemType Directory -Force $SevenZipRoot | Out-Null
    $SevenZipInstall = Start-Process (Join-Path $BinariesRoot "7z2601-x64.exe") `
        -ArgumentList @("/S", "/D=$SevenZipRoot") -Wait -PassThru
    if ($SevenZipInstall.ExitCode -ne 0 -or -not (Test-Path $SevenZip)) {
        throw "Nie udało się zainstalować lokalnego 7-Zip."
    }
}

$MtaInstaller = Join-Path $Downloads "mtasa-1.6-x86.exe"
$MysqlArchive = Join-Path $Downloads "mysql-5.7.44-winx64.zip"
Get-VerifiedFile -Uri $MtaUrl -Destination $MtaInstaller -Sha256 $MtaSha256
Get-VerifiedFile -Uri $MysqlUrl -Destination $MysqlArchive -Sha256 $MysqlSha256

$MtaExtract = Join-Path $InstallRoot "mta-distribution"
if (-not (Test-Path $MtaExtract)) {
    New-Item -ItemType Directory -Force $MtaExtract | Out-Null
    & $SevenZip x $MtaInstaller "-o$MtaExtract" -y
    if ($LASTEXITCODE -gt 1) { throw "Nie udało się wypakować instalatora MTA." }
}
$ServerExe = Get-ChildItem $MtaExtract -Filter "MTA Server.exe" -Recurse | Select-Object -First 1
if (-not $ServerExe) { throw "W przypiętym instalatorze nie znaleziono MTA Server.exe." }
$ServerRoot = $ServerExe.Directory.FullName

$MysqlExtract = Join-Path $InstallRoot "mysql"
if (-not (Test-Path $MysqlExtract)) {
    Expand-Archive $MysqlArchive $MysqlExtract -Force
}
$MysqlHome = (Get-ChildItem $MysqlExtract -Directory | Where-Object {
    Test-Path (Join-Path $_.FullName "bin\mysqld.exe")
} | Select-Object -First 1).FullName
if (-not $MysqlHome) { throw "Nie znaleziono mysqld.exe po wypakowaniu MySQL." }
$MysqlData = Join-Path $InstallRoot "mysql-data"
if (-not (Test-Path (Join-Path $MysqlData "mysql"))) {
    New-Item -ItemType Directory -Force $MysqlData | Out-Null
    & (Join-Path $MysqlHome "bin\mysqld.exe") --initialize-insecure `
        --basedir=$MysqlHome --datadir=$MysqlData
    if ($LASTEXITCODE -ne 0) { throw "Inicjalizacja MySQL nie powiodła się." }
}

$State = [ordered]@{
    installRoot = $InstallRoot
    serverRoot = $ServerRoot
    mysqlHome = $MysqlHome
    mysqlData = $MysqlData
    mysqlPort = $MysqlPort
    database = "mrucznik"
    databaseUser = "samp"
    databasePassword = "funia"
}
$State | ConvertTo-Json | Set-Content (Join-Path $InstallRoot "installation.json") -Encoding UTF8

Copy-Item (Join-Path $PSScriptRoot "WindowsHelpers.ps1") $InstallRoot -Force
Copy-Item (Join-Path $PSScriptRoot "Start-MrucznikMTA.ps1") $InstallRoot -Force
Copy-Item (Join-Path $PSScriptRoot "Stop-MrucznikMTA.ps1") $InstallRoot -Force
Copy-Item (Join-Path $PSScriptRoot "Test-MrucznikMTA.ps1") $InstallRoot -Force
. (Join-Path $InstallRoot "WindowsHelpers.ps1")
$LoadedState = Get-MrpInstallState -InstallRoot $InstallRoot
Start-MrpMysql -State $LoadedState

$ImportMarker = Join-Path $InstallRoot ".database-imported"
if (-not (Test-Path $ImportMarker)) {
    $MysqlExe = Join-Path $MysqlHome "bin\mysql.exe"
    & $MysqlExe --protocol=TCP "--host=127.0.0.1" "--port=$MysqlPort" "--user=root" -e `
        "DROP DATABASE IF EXISTS mrucznik; DROP USER IF EXISTS 'samp'@'%'; CREATE DATABASE mrucznik; CREATE USER 'samp'@'%' IDENTIFIED WITH mysql_native_password BY 'funia'; GRANT ALL ON mrucznik.* TO 'samp'@'%'; FLUSH PRIVILEGES;"
    if ($LASTEXITCODE -ne 0) { throw "Nie udało się utworzyć lokalnej bazy i użytkownika." }
    foreach ($File in Get-ChildItem (Join-Path $PayloadRoot "database\schema\*.sql") |
        Where-Object Name -NotLike "view_*" | Sort-Object Name) {
        Invoke-MysqlFile -MysqlExe $MysqlExe -File $File.FullName -Database "mrucznik"
    }
    Invoke-MysqlFile -MysqlExe $MysqlExe -File (Join-Path $PayloadRoot "database\routines.sql")
    foreach ($File in Get-ChildItem (Join-Path $PayloadRoot "database\schema\view_*.sql") | Sort-Object Name) {
        Invoke-MysqlFile -MysqlExe $MysqlExe -File $File.FullName -Database "mrucznik"
    }
    foreach ($File in Get-ChildItem (Join-Path $PayloadRoot "database\data\*.sql") | Sort-Object Name) {
        Invoke-MysqlFile -MysqlExe $MysqlExe -File $File.FullName -Database "mrucznik"
    }
    Set-Content $ImportMarker "MySQL 5.7.44 / mrucznik" -Encoding ASCII
}

$MysqlHostForMta = if ($MysqlPort -eq 3306) { "127.0.0.1" } else { "127.0.0.1;port=$MysqlPort" }
& (Join-Path $PayloadRoot "mta\setup.ps1") `
    -MtaServerRoot $ServerRoot `
    -ColAndreasDll (Join-Path $BinariesRoot "ColAndreas.dll") `
    -KingDll (Join-Path $BinariesRoot "king.dll") `
    -MysqlHost $MysqlHostForMta -MysqlUser "samp" -MysqlDatabase "mrucznik" `
    -MysqlPassword "funia" -RedisHost "127.0.0.1" -RedisPort 6379

$AclPath = Join-Path $ServerRoot "mods\deathmatch\acl.xml"
[xml]$Acl = Get-Content $AclPath
$Admin = $Acl.acl.group | Where-Object { $_.name -eq "Admin" }
if (-not $Admin) { throw "Brak grupy Admin w acl.xml." }
if (-not ($Admin.object | Where-Object { $_.name -eq "resource.amx" })) {
    $Object = $Acl.CreateElement("object")
    $Object.SetAttribute("name", "resource.amx")
    [void]$Admin.AppendChild($Object)
    $Acl.Save($AclPath)
}

Write-Host "Instalacja zakończona: $InstallRoot"
if (-not $SkipRuntimeTest) {
    & (Join-Path $InstallRoot "Test-MrucznikMTA.ps1") -InstallRoot $InstallRoot
}
Write-Host "Start: $InstallRoot\Start-MrucznikMTA.ps1"
Write-Host "Połączenie z klienta MTA: 127.0.0.1:22003"
$global:LASTEXITCODE = 0
return
