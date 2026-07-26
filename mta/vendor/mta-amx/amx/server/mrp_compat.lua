-- M-RP additions for SA-MP 0.3.DL model IDs.

-- The old WPS decoration contains nine stock BinNt07_LA objects placed as a
-- repeated row across the public road. Keep the upstream submodule untouched,
-- but suppress those exact legacy placements in the MTA compatibility layer.
-- The sentinel follows the normal custom-model path, which guarantees that the
-- transport object remains invisible and non-collidable on every client.
MRP_SUPPRESSED_OBJECT_MODEL = -2147483647
MRP_DISABLE_VICE_CITY = true
MRP_DISABLE_CONTRABAND = true

local disabledCommands = {
    -- Vice City entry points and maintenance commands.
    gotovc = true,
    gotovcint = true,
    fixvc = true,
    fixvicecity = true,
    -- Contraband and smuggling gameplay.
    przemyt = true,
    zrzut = true,
    sellkontrabanda = true,
    sellcontraband = true,
    sellkontraband = true,
    sellkontrabande = true,
    sprzedajkontrabande = true,
    sellkontrabandabot = true,
    sprzedajkontrabandebot = true,
    setkontrabanda = true,
    sprzedajprzemyt = true,
    sellprzemyt = true,
    sellsmuggled = true,
    jetpack = true,
    pancerz = true,
}

function mrpBlockDisabledCommand(player, command)
    local name = tostring(command or ""):gsub("^%s*/+", ""):match("^([^%s]+)")
    name = name and name:lower() or ""
    if not disabledCommands[name] then return false end
    outputChatBox(
        "[M-RP] Ta funkcja zostala wylaczona przez administracje serwera.",
        player, 255, 190, 70
    )
    return true
end

local function isViceCityModel(model)
    model = tonumber(model)
    -- The bundled VC catalog occupies negative IDs from -3001 downwards.
    return MRP_DISABLE_VICE_CITY and model and model <= -3000
end

local suppressedLegacyObjectPositions = {
    { 2511.49, -2020.82, 13.20 },
    { 2525.22, -2015.97, 13.20 },
    { 2525.18, -1999.27, 13.43 },
    { 2504.39, -1998.48, 13.20 },
    { 2480.99, -1995.30, 13.20 },
    { 2463.91, -1995.87, 13.34 },
    { 2469.20, -2020.50, 13.20 },
    { 2441.65, -2020.67, 13.20 },
    { 2482.57, -2021.26, 13.20 },
}

function mrpIsSuppressedLegacyObject(model, x, y, z)
    x, y, z = tonumber(x), tonumber(y), tonumber(z)
    if not x or not y or not z then return false end
    -- Vice City was translated far west of San Andreas. Suppress both its
    -- custom models and stock decoration objects, including collision helpers.
    if MRP_DISABLE_VICE_CITY and x <= -3000 then return true end
    -- Models 1579 and 1580 are used exclusively by the random and action
    -- contraband boxes in this gamemode.
    if MRP_DISABLE_CONTRABAND
        and (tonumber(model) == 1579 or tonumber(model) == 1580)
    then
        return true
    end
    if tonumber(model) ~= 1337 then return false end
    for _, position in ipairs(suppressedLegacyObjectPositions) do
        local dx, dy, dz = x - position[1], y - position[2], z - position[3]
        if dx * dx + dy * dy + dz * dz <= 0.04 then return true end
    end
    return false
end

function mrpResolveSkin(skin)
    local models = getResourceFromName("mrp_models")
    if not models or getResourceState(models) ~= "running" then
        return skin, false
    end
    local base = call(models, "getBaseModel", skin)
    if base then
        return base, skin
    end
    return skin, false
end

function mrpApplyCustomSkin(player, customSkin)
    setElementData(player, "mrp:customSkin", customSkin or false, "broadcast")
end

function mrpResolveObjectModel(model)
    local logicalModel = tonumber(model)
    if not logicalModel then
        return 1337, false
    end
    if isViceCityModel(logicalModel)
        or (MRP_DISABLE_CONTRABAND
            and (logicalModel == 1579 or logicalModel == 1580))
    then
        return 1337, MRP_SUPPRESSED_OBJECT_MODEL
    end
    local models = getResourceFromName("mrp_models")
    if models and getResourceState(models) == "running" then
        local base = call(models, "getObjectBaseModel", logicalModel)
        if base then
            return base, logicalModel
        end
    end
    if logicalModel < 321 or logicalModel > 18630 then
        -- Keep the requested logical ID even when its registry entry is not
        -- ready or absent. The client can then apply the matching custom model
        -- later; if it is genuinely unknown, the 1337 transport placeholder
        -- stays invisible instead of becoming a row of visible trash bins.
        return 1337, logicalModel
    end
    return logicalModel, false
end

function mrpApplyCustomObjectModel(object, customModel)
    if object and customModel then
        setElementData(object, "mrp:customObjectModel", customModel, "broadcast")
    end
end

local function modelsResource()
    local models = getResourceFromName("mrp_models")
    if models and getResourceState(models) == "running" then
        return models
    end
    return false
end

function AddSimpleModel(amx, virtualWorld, baseModel, customModel, dff, txd)
    if MRP_DISABLE_VICE_CITY
        and (tostring(dff):find("vc4samp/", 1, true)
            or tostring(txd):find("vc4samp/", 1, true)
            or isViceCityModel(customModel))
    then
        return 1
    end
    local models = modelsResource()
    if not models then
        return 0
    end
    return call(models, "registerObjectModel", customModel, baseModel, dff, txd, virtualWorld) and 1 or 0
end

function AddSimpleModelTimed(amx, virtualWorld, baseModel, customModel, dff, txd, timeOn, timeOff)
    if MRP_DISABLE_VICE_CITY
        and (tostring(dff):find("vc4samp/", 1, true)
            or tostring(txd):find("vc4samp/", 1, true)
            or isViceCityModel(customModel))
    then
        return 1
    end
    local models = modelsResource()
    if not models then
        return 0
    end
    return call(models, "registerObjectModel", customModel, baseModel, dff, txd, virtualWorld, timeOn, timeOff) and 1 or 0
end

-- MTA distributes resource files before the player enters the game. SA-MP's
-- per-file HTTP redirection callback therefore has no equivalent work to do.
function FindTextureFileNameFromCRC(amx, crc, output, size)
    return 0
end

function FindModelFileNameFromCRC(amx, crc, output, size)
    return 0
end


function RedirectDownload(amx, player, url)
    return true
end

-- Pawn.RakNet cannot be loaded in MTA because its hooks target the SA-MP
-- RakNet server. These registrations keep the original AMX loadable; packet
-- validation is handled by MTA and mrp_bridge. The callbacks are intentionally
-- not registered, so packet-only read operations are never reached.
local mrpBitstreamId = 0

function PR_Init(amx)
    return true
end

function PR_RegHandler(amx, eventId, publicName, eventType)
    return true
end

function BS_New(amx)
    mrpBitstreamId = mrpBitstreamId + 1
    return mrpBitstreamId
end

function BS_Delete(amx, bitstreamRef)
    amx.memDAT[bitstreamRef] = 0
    return true
end

function BS_IgnoreBits(amx, bitstream, bitCount)
    return true
end

function BS_SetWriteOffset(amx, bitstream, offset)
    return true
end

function BS_WriteValue(amx, bitstream)
    return true
end

function BS_ReadValue(amx, bitstream)
    return false
end

function PR_SendRPC(amx, bitstream, player, rpcId, priority, reliability, orderingChannel)
    return true
end

g_SAMPSyscallPrototypes.AddSimpleModel = {'i', 'i', 'i', 's', 's'}
g_SAMPSyscallPrototypes.AddSimpleModelTimed = {'i', 'i', 'i', 's', 's', 'i', 'i'}
g_SAMPSyscallPrototypes.FindTextureFileNameFromCRC = {'i', 'r', 'i'}
g_SAMPSyscallPrototypes.FindModelFileNameFromCRC = {'i', 'r', 'i'}
g_SAMPSyscallPrototypes.RedirectDownload = {'p', 's'}
g_SAMPSyscallPrototypes.PR_Init = {}
g_SAMPSyscallPrototypes.PR_RegHandler = {'i', 's', 'i'}
g_SAMPSyscallPrototypes.BS_New = {}
g_SAMPSyscallPrototypes.BS_Delete = {'r'}
g_SAMPSyscallPrototypes.BS_IgnoreBits = {'i', 'i'}
g_SAMPSyscallPrototypes.BS_SetWriteOffset = {'i', 'i'}
g_SAMPSyscallPrototypes.BS_WriteValue = {'i'}
g_SAMPSyscallPrototypes.BS_ReadValue = {'i'}
g_SAMPSyscallPrototypes.PR_SendRPC = {'i', 'p', 'i', 'i', 'i', 'i'}

-- One-time house ownership reset. Houses are legacy INI files inside this
-- resource, not rows in MySQL. Preserve every occupied file verbatim in one
-- backup before making all houses purchasable.
local HOUSE_RESET_VERSION = "20260726-v1"
local HOUSE_RESET_DONE = "scriptfiles/Domy/.owners-reset-" .. HOUSE_RESET_VERSION .. ".done"
local HOUSE_RESET_BACKUP = "scriptfiles/Domy/owners-backup-" .. HOUSE_RESET_VERSION .. ".txt"

local function readResourceFile(path)
    if not fileExists(path) then return false end
    local handle = fileOpen(path, true)
    if not handle then return false end
    local content = fileRead(handle, fileGetSize(handle))
    fileClose(handle)
    return content
end

local function replaceResourceFile(path, content)
    local temporary = path .. ".codex-tmp"
    if fileExists(temporary) then fileDelete(temporary) end
    local handle = fileCreate(temporary)
    if not handle then return false end
    fileWrite(handle, content)
    fileClose(handle)
    if fileExists(path) and not fileDelete(path) then
        fileDelete(temporary)
        return false
    end
    return fileRename(temporary, path)
end

local houseResetValues = {
    Wlasciciel = "Brak",
    Kupiony = "0",
    UID_Wlascicela = "0",
    Zamek = "0",
    Data = "0",
    Pokoi_Wynajmowanych = "0",
    Wynajmowanie = "0",
    Warunek_Wynajmu = "1",
    Tryb_WW = "1",
    Uprawnienia_Lokatorow_Zamek = "0",
    Uprawnienia_Lokatorow_Dodatki = "0",
    Oswietlenie = "0",
    Apteczka = "0",
    Kamizelka = "0",
    Sejf = "1",
    Kod_Do_Sejfu = "500500500500",
    Zbrojownia = "0",
    Garaz = "0",
    Ladowisko = "0",
    Alarm = "0",
    Zamek_Dodatkowy = "0",
    Komputer = "0",
    Sprzet_RTV = "0",
    Zestaw_Hazardowy = "0",
    Szafa = "0",
    Tajemniczy_Dodatek = "0",
    S_kasa = "0",
    S_mats = "0",
    S_ziolo = "0",
    S_drugs = "0",
}
for index = 1, 10 do houseResetValues["Lokator" .. index] = "Brak" end
for index = 1, 11 do
    houseResetValues["S_PG" .. index] = "0"
    houseResetValues["S_G" .. index] = "0"
    houseResetValues["S_A" .. index] = "0"
end
houseResetValues.S_G0 = "0"

local function resetHouseContent(content)
    local output, seen = {}, {}
    for line in (content .. "\n"):gmatch("(.-)\r?\n") do
        local rawKey = line:match("^([^=]+)=")
        local key = rawKey and rawKey:match("^%s*(.-)%s*$")
        if key and houseResetValues[key] ~= nil then
            line = rawKey .. "= " .. houseResetValues[key]
            seen[key] = true
        end
        output[#output + 1] = line
    end
    for key, value in pairs(houseResetValues) do
        if not seen[key] then output[#output + 1] = key .. "=" .. value end
    end
    return table.concat(output, "\n")
end

local function resetHouseOwnersOnce()
    if fileExists(HOUSE_RESET_DONE) then return end
    local registry = readResourceFile("scriptfiles/Domy/NRD.ini")
    local maximum = registry and tonumber(registry:match("NrDomow%s*=%s*(%d+)"))
    if not maximum then
        outputDebugString("[MRP houses] Nie mozna odczytac Domy/NRD.ini; reset anulowany.", 1)
        return
    end

    if fileExists(HOUSE_RESET_BACKUP) then fileDelete(HOUSE_RESET_BACKUP) end
    local backup = fileCreate(HOUSE_RESET_BACKUP)
    if not backup then
        outputDebugString("[MRP houses] Nie mozna utworzyc kopii; reset anulowany.", 1)
        return
    end

    local changed = 0
    -- Historical packs contain sparse IDs above NrDomow (up to 3000).
    -- Checking to 5000 is cheap once and prevents leaving such houses owned.
    for id = 0, math.max(maximum, 5000) do
        local path = "scriptfiles/Domy/Dom" .. id .. ".ini"
        local content = readResourceFile(path)
        if content then
            local bought = tonumber(content:match("\n?Kupiony%s*=%s*(-?%d+)")) or 0
            local ownerUid = tonumber(content:match("\n?UID_Wlascicela%s*=%s*(-?%d+)")) or 0
            local owner = content:match("\n?Wlasciciel%s*=%s*([^\r\n]*)") or ""
            local occupied = bought ~= 0 or ownerUid ~= 0
                or (owner ~= "" and owner ~= "Brak" and owner ~= "Gracz Nieaktywny")
            if occupied then
                fileWrite(backup, ("\n===== Dom%d.ini =====\n%s\n"):format(id, content))
                changed = changed + 1
                if not replaceResourceFile(path, resetHouseContent(content)) then
                    fileClose(backup)
                    outputDebugString(
                        "[MRP houses] Blad zapisu Dom" .. id .. ".ini; reset przerwany.", 1
                    )
                    return
                end
            end
        end
    end
    fileClose(backup)

    local done = fileCreate(HOUSE_RESET_DONE)
    if done then
        fileWrite(done, ("reset=%s\nhouses=%d\n"):format(HOUSE_RESET_VERSION, changed))
        fileClose(done)
    end
    outputDebugString(("[MRP houses] Udostepniono wszystkie domy; poprzedni wlasciciele: %d."):format(changed))
end

resetHouseOwnersOnce()
