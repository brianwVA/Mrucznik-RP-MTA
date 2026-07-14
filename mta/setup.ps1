[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$MtaServerRoot,

    [Parameter(Mandatory = $true)]
    [string]$ColAndreasDll,

    [Parameter(Mandatory = $true)]
    [string]$KingDll,

    [string]$MysqlHost = "127.0.0.1",
    [string]$MysqlUser = "samp",
    [string]$MysqlDatabase = "mrucznik",
    [string]$MysqlPassword = "funia",
    [string]$RedisHost = "127.0.0.1",
    [int]$RedisPort = 6379,
    [string]$RedisPassword = ""
)

$ErrorActionPreference = "Stop"
$ProjectRoot = Split-Path -Parent $PSScriptRoot
$ServerFilesArchive = Join-Path $ProjectRoot "serverfiles.tar.gz"
$ResourcesRoot = Join-Path $MtaServerRoot "mods\deathmatch\resources"
$PluginLockPath = Join-Path $PSScriptRoot "plugins.lock.json"
$AmxVersion = "v0.3"
$AmxSha256 = "e15e50239e7bf488ec433e597c6d19f30bbbe6e543f449af6ec182b5ed870c3f"
$AmxUrl = "https://github.com/multitheftauto/amx/releases/download/$AmxVersion/amx.zip"
$ObjectPreviewSha256 = "17f3455d20083782e897fe9bb7ce45f0349d1fd2fc74975a990db1f8344f7625"
$ObjectPreviewPage = "https://community.multitheftauto.com/index.php?p=resources&resource=11836&s=download&selectincludes=1"
$ObjectPreviewUrl = "https://community.multitheftauto.com/modules/resources/doDownload.php?file=object_preview_0.7.0.zip&name=object_preview.zip"
$Vc2010RedistUrl = "https://download.microsoft.com/download/1/6/5/165255E7-1014-4D0A-B094-B6A430A6BFFC/vcredist_x86.exe"
$Vc2010RedistSha256 = "99dce3c841cc6028560830f7866c9ce2928c98cf3256892ef8e6cf755147b0d8"

function Invoke-BoundedDownload {
    param(
        [Parameter(Mandatory = $true)]
        [string]$Uri,

        [Parameter(Mandatory = $true)]
        [string]$OutFile
    )

    for ($Attempt = 1; $Attempt -le 3; $Attempt++) {
        & curl.exe --fail --location --silent --show-error `
            --connect-timeout 30 --max-time 300 `
            --output $OutFile $Uri
        if ($LASTEXITCODE -eq 0) { return }
        Remove-Item $OutFile -Force -ErrorAction SilentlyContinue
        if ($Attempt -lt 3) { Start-Sleep -Seconds 2 }
    }
    throw "Nie udało się pobrać $Uri po 3 próbach."
}

if (-not (Test-Path (Join-Path $MtaServerRoot "MTA Server.exe"))) {
    throw "Nie znaleziono 32-bitowego MTA Server.exe w: $MtaServerRoot"
}
if (-not (Test-Path $ServerFilesArchive)) {
    throw "Brak serverfiles.tar.gz. Pobierz repozytorium razem z Git LFS."
}
if (-not (Test-Path $PluginLockPath)) {
    throw "Brak przypiętego manifestu plugins.lock.json."
}
if (-not (Test-Path $ColAndreasDll)) {
    throw "Brak ColAndreas.dll z workflow build-colandreas: $ColAndreasDll"
}
if (-not (Test-Path $KingDll)) {
    throw "Brak king.dll z workflow build-amx: $KingDll"
}

$Work = Join-Path $env:TEMP "mrp-mta-setup"
if (Test-Path $Work) { Remove-Item -Recurse -Force $Work }
New-Item -ItemType Directory -Force $Work | Out-Null

$Vc2010Redist = Join-Path $Work "vcredist2010-x86.exe"
Invoke-BoundedDownload -Uri $Vc2010RedistUrl -OutFile $Vc2010Redist
$ActualHash = (Get-FileHash -Algorithm SHA256 $Vc2010Redist).Hash.ToLowerInvariant()
if ($ActualHash -ne $Vc2010RedistSha256) {
    throw "Niepoprawna suma SHA-256 vcredist2010-x86.exe: $ActualHash"
}
$VcInstall = Start-Process $Vc2010Redist -ArgumentList @("/q", "/norestart") -Wait -PassThru
if ($VcInstall.ExitCode -notin @(0, 1638, 3010)) {
    throw "Instalacja Visual C++ 2010 x86 zakończyła się kodem $($VcInstall.ExitCode)."
}

$AmxZip = Join-Path $Work "amx.zip"
Invoke-WebRequest -Uri $AmxUrl -OutFile $AmxZip
$ActualHash = (Get-FileHash -Algorithm SHA256 $AmxZip).Hash.ToLowerInvariant()
if ($ActualHash -ne $AmxSha256) {
    throw "Niepoprawna suma SHA-256 amx.zip: $ActualHash"
}
Expand-Archive -Path $AmxZip -DestinationPath $MtaServerRoot -Force
$ModuleDirectory = Join-Path $MtaServerRoot "mods\deathmatch\modules"
New-Item -ItemType Directory -Force $ModuleDirectory | Out-Null
$InstalledKingDll = Join-Path $ModuleDirectory "king.dll"
Copy-Item $KingDll $InstalledKingDll -Force
if ((Get-FileHash -Algorithm SHA256 $InstalledKingDll).Hash -ne
    (Get-FileHash -Algorithm SHA256 $KingDll).Hash) {
    throw "Podmiana modułu king.dll nie zachowała oczekiwanych bajtów."
}

$ObjectPreviewZip = Join-Path $Work "object_preview.zip"
Invoke-WebRequest -UseBasicParsing -Uri $ObjectPreviewPage -SessionVariable ObjectPreviewSession | Out-Null
Invoke-WebRequest -UseBasicParsing -Uri $ObjectPreviewUrl -WebSession $ObjectPreviewSession `
    -Headers @{ Referer = $ObjectPreviewPage } -OutFile $ObjectPreviewZip
$ObjectPreviewHash = (Get-FileHash -Algorithm SHA256 $ObjectPreviewZip).Hash.ToLowerInvariant()
if ($ObjectPreviewHash -ne $ObjectPreviewSha256) {
    throw "Niepoprawna suma SHA-256 object_preview.zip: $ObjectPreviewHash"
}
$ObjectPreviewResource = Join-Path $ResourcesRoot "object_preview"
if (Test-Path $ObjectPreviewResource) { Remove-Item -Recurse -Force $ObjectPreviewResource }
Expand-Archive -Path $ObjectPreviewZip -DestinationPath $ObjectPreviewResource -Force

$AmxResource = Join-Path $ResourcesRoot "amx"
New-Item -ItemType Directory -Force $AmxResource | Out-Null
Copy-Item -Path (Join-Path $PSScriptRoot "vendor\mta-amx\amx\*") -Destination $AmxResource -Recurse -Force

$PluginRoot = Join-Path $AmxResource "plugins"
New-Item -ItemType Directory -Force $PluginRoot | Out-Null
$PluginLock = Get-Content $PluginLockPath -Raw | ConvertFrom-Json
$LoadNames = New-Object System.Collections.Generic.List[string]

foreach ($Plugin in $PluginLock.plugins) {
    $PackageName = "$($Plugin.name)-$($Plugin.version)"
    $PackagePath = Join-Path $Work "$PackageName.download"
    Write-Host "Pobieranie $PackageName"
    Invoke-BoundedDownload -Uri $Plugin.url -OutFile $PackagePath
    $PackageHash = (Get-FileHash -Algorithm SHA256 $PackagePath).Hash.ToLowerInvariant()
    if ($PackageHash -ne $Plugin.sha256) {
        throw "Niepoprawna suma SHA-256 $PackageName`: $PackageHash"
    }

    $PackageRoot = $PackagePath
    if ($Plugin.archive -eq "zip") {
        $PackageRoot = Join-Path $Work "$PackageName-extracted"
        Expand-Archive -Path $PackagePath -DestinationPath $PackageRoot -Force
    } elseif ($Plugin.archive -ne "file") {
        throw "Nieobsługiwany format pakietu $PackageName`: $($Plugin.archive)"
    }

    foreach ($File in $Plugin.files.psobject.Properties) {
        $Source = if ($File.Name -eq ".") { $PackageRoot } else { Join-Path $PackageRoot $File.Name }
        if (-not (Test-Path $Source)) {
            throw "Brak $($File.Name) w pakiecie $PackageName"
        }
        $Destination = Join-Path $AmxResource $File.Value
        New-Item -ItemType Directory -Force (Split-Path -Parent $Destination) | Out-Null
        Copy-Item $Source $Destination -Force
    }
    $LoadNames.Add([string]$Plugin.load_name)
}

$ColAndreas = $PluginLock.built_plugins | Where-Object { $_.name -eq "ColAndreas" }
Copy-Item $ColAndreasDll (Join-Path $AmxResource $ColAndreas.destination) -Force
$LoadNames.Add([string]$ColAndreas.load_name)

[xml]$AmxMeta = Get-Content (Join-Path $AmxResource "meta.xml")
$PluginSetting = $AmxMeta.meta.settings.setting | Where-Object { $_.name -eq "plugins" }
$PluginSetting.value = $LoadNames -join " "
$FilterScripts = @("animy", "realtime", "sobeitblock", "SAN_extPSq")
$FilterScriptSetting = $AmxMeta.meta.settings.setting | Where-Object { $_.name -eq "filterscripts" }
$FilterScriptSetting.value = $FilterScripts -join " "
$AmxMeta.Save((Join-Path $AmxResource "meta.xml"))

tar -xzf $ServerFilesArchive -C $Work `
    --exclude=serverfiles/scriptfiles/DANGEROUS_SERVER_ROOT `
    serverfiles/gamemodes/Mrucznik-RP.amx `
    serverfiles/filterscripts/animy.amx `
    serverfiles/filterscripts/realtime.amx `
    serverfiles/filterscripts/sobeitblock.amx `
    serverfiles/filterscripts/SAN_extPSq.amx `
    serverfiles/scriptfiles `
    serverfiles/models
if ($LASTEXITCODE -ne 0) { throw "Nie udało się wypakować oryginalnych plików SA-MP." }

$BaselineResource = Join-Path $ResourcesRoot "amx-mrucznik"
New-Item -ItemType Directory -Force $BaselineResource | Out-Null
Copy-Item (Join-Path $Work "serverfiles\gamemodes\Mrucznik-RP.amx") $BaselineResource -Force
Copy-Item (Join-Path $PSScriptRoot "server\mods\deathmatch\resources\amx-mrucznik\meta.xml") $BaselineResource -Force

foreach ($FilterScript in $FilterScripts) {
    $FilterResource = Join-Path $ResourcesRoot "amx-fs-$FilterScript"
    New-Item -ItemType Directory -Force $FilterResource | Out-Null
    Copy-Item (Join-Path $Work "serverfiles\filterscripts\$FilterScript.amx") $FilterResource -Force
    $FilterMeta = New-Object System.Xml.XmlDocument
    $MetaNode = $FilterMeta.CreateElement("meta")
    [void]$FilterMeta.AppendChild($MetaNode)
    $InfoNode = $FilterMeta.CreateElement("info")
    $InfoNode.SetAttribute("name", "Mrucznik RP filterscript $FilterScript")
    $InfoNode.SetAttribute("type", "script")
    [void]$MetaNode.AppendChild($InfoNode)
    $AmxNode = $FilterMeta.CreateElement("amx")
    $AmxNode.SetAttribute("src", "$FilterScript.amx")
    [void]$MetaNode.AppendChild($AmxNode)
    $FilterMeta.Save((Join-Path $FilterResource "meta.xml"))
}

Copy-Item -Path (Join-Path $Work "serverfiles\scriptfiles\*") -Destination (Join-Path $AmxResource "scriptfiles") -Recurse -Force
$MysqlConfig = Join-Path $AmxResource "scriptfiles\MySQL\connect.ini"
@(
    "Host=$MysqlHost"
    "User=$MysqlUser"
    "DB=$MysqlDatabase"
    "Pass=$MysqlPassword"
) | Set-Content -Path $MysqlConfig -Encoding ASCII
$RedisConfig = Join-Path $AmxResource "scriptfiles\redis.ini"
@(
    "host=$RedisHost"
    "port=$RedisPort"
    "password=$RedisPassword"
) | Set-Content -Path $RedisConfig -Encoding ASCII

$BridgeResource = Join-Path $ResourcesRoot "mrp_bridge"
New-Item -ItemType Directory -Force $BridgeResource | Out-Null
Copy-Item -Path (Join-Path $PSScriptRoot "server\mods\deathmatch\resources\mrp_bridge\*") -Destination $BridgeResource -Recurse -Force

$ModelsResource = Join-Path $ResourcesRoot "mrp_models"
New-Item -ItemType Directory -Force $ModelsResource | Out-Null
Copy-Item -Path (Join-Path $PSScriptRoot "server\mods\deathmatch\resources\mrp_models\*") -Destination $ModelsResource -Recurse -Force
$ModelAssets = Join-Path $ModelsResource "assets"
New-Item -ItemType Directory -Force $ModelAssets | Out-Null
Copy-Item -Path (Join-Path $Work "serverfiles\models\*.dff") -Destination $ModelAssets -Force
Copy-Item -Path (Join-Path $Work "serverfiles\models\*.txd") -Destination $ModelAssets -Force
Copy-Item -Path (Join-Path $Work "serverfiles\models\vc4samp") -Destination $ModelAssets -Recurse -Force

[xml]$ModelsMeta = Get-Content (Join-Path $ModelsResource "meta.xml")
Get-ChildItem $ModelAssets -File -Recurse | Sort-Object FullName | ForEach-Object {
    $RelativeAssetPath = $_.FullName.Substring($ModelAssets.Length + 1).Replace("\", "/")
    $FileNode = $ModelsMeta.CreateElement("file")
    $FileNode.SetAttribute("src", "assets/$RelativeAssetPath")
    [void]$ModelsMeta.meta.AppendChild($FileNode)
}
$ModelsMeta.Save((Join-Path $ModelsResource "meta.xml"))

$ServerConfigPath = Join-Path $MtaServerRoot "mods\deathmatch\mtaserver.conf"
if (-not (Test-Path $ServerConfigPath)) {
    throw "Brak mods\deathmatch\mtaserver.conf w instalacji MTA."
}
[xml]$ServerConfig = Get-Content $ServerConfigPath
if (-not ($ServerConfig.config.module | Where-Object { $_.src -eq "king.dll" })) {
    $ModuleNode = $ServerConfig.CreateElement("module")
    $ModuleNode.SetAttribute("src", "king.dll")
    [void]$ServerConfig.config.AppendChild($ModuleNode)
}
foreach ($ResourceName in @("object_preview", "mrp_models", "amx", "mrp_bridge", "amx-mrucznik")) {
    $ResourceNode = $ServerConfig.config.resource | Where-Object { $_.src -eq $ResourceName }
    if (-not $ResourceNode) {
        $ResourceNode = $ServerConfig.CreateElement("resource")
        $ResourceNode.SetAttribute("src", $ResourceName)
        [void]$ServerConfig.config.AppendChild($ResourceNode)
    }
    $ResourceNode.SetAttribute("startup", "1")
    $ResourceNode.SetAttribute("protected", "0")
}
$ServerConfig.Save($ServerConfigPath)

Write-Host "Pliki Mrucznik RP zostały zainstalowane w $MtaServerRoot"
Write-Host "Pluginy zgodności zostały pobrane i zweryfikowane na podstawie plugins.lock.json"
Write-Host "MySQL: $MysqlUser@$MysqlHost/$MysqlDatabase"
Write-Host "Redis: $RedisHost`:$RedisPort"
Write-Host "Moduł king.dll i zasoby startowe zostały wpisane do mtaserver.conf"
Write-Host "Przy pierwszym uruchomieniu wykonaj: aclrequest allow amx all"
