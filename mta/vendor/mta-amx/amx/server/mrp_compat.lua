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

function PR_SendPacket(amx, bitstream, player, priority, reliability, orderingChannel)
    return true
end

function BS_GetNumberOfBytesUsed(amx, bitstream, output)
    amx.memDAT[output] = 0
    return true
end

function BS_SetReadOffset(amx, bitstream, offset)
    return true
end

function BS_ResetReadPointer(amx, bitstream)
    return true
end

-- open.mp renamed the original SA-MP SQLite API.  Both variants use the same
-- handles and result storage in mta-amx, so these are real adapters rather
-- than dummy natives.
function DB_Open(amx, name, flags)
    return db_open(amx, name)
end

function DB_ExecuteQuery(amx, database, query)
    return db_query(amx, database, query)
end

function DB_FreeResultSet(amx, result)
    return db_free_result(amx, result)
end

function DB_GetRowCount(amx, result)
    return db_num_rows(amx, result)
end

function DB_SelectNextRow(amx, result)
    return db_next_row(amx, result)
end

function DB_GetFieldString(amx, result, field, output, size)
    return db_get_field(amx, result, field, output, size)
end

function DB_GetFieldIntByName(amx, result, field)
    return db_get_field_assoc_int(amx, result, field)
end

function DB_GetFieldFloatByName(amx, result, field)
    return db_get_field_assoc_float(amx, result, field)
end

local function writeSpawnInfo(amx, data, team, skin, x, y, z, angle,
                              weapon1, ammo1, weapon2, ammo2, weapon3, ammo3)
    if not data then return false end
    local weapons = data.weapons or {}
    amx.memDAT[team] = tonumber(data[8]) or 0
    amx.memDAT[skin] = tonumber(data[5]) or 0
    writeMemFloat(amx, x, tonumber(data[1]) or 0)
    writeMemFloat(amx, y, tonumber(data[2]) or 0)
    writeMemFloat(amx, z, tonumber(data[3]) or 0)
    writeMemFloat(amx, angle, tonumber(data[4]) or 0)
    amx.memDAT[weapon1] = tonumber(weapons[1] and weapons[1][1]) or 0
    amx.memDAT[ammo1] = tonumber(weapons[1] and weapons[1][2]) or 0
    amx.memDAT[weapon2] = tonumber(weapons[2] and weapons[2][1]) or 0
    amx.memDAT[ammo2] = tonumber(weapons[2] and weapons[2][2]) or 0
    amx.memDAT[weapon3] = tonumber(weapons[3] and weapons[3][1]) or 0
    amx.memDAT[ammo3] = tonumber(weapons[3] and weapons[3][2]) or 0
    return true
end

function GetSpawnInfo(amx, player, team, skin, x, y, z, angle,
                      weapon1, ammo1, weapon2, ammo2, weapon3, ammo3)
    if not player then return false end
    local playerData = g_Players[getElemID(player)]
    return writeSpawnInfo(amx, playerData and playerData.spawninfo, team, skin,
        x, y, z, angle, weapon1, ammo1, weapon2, ammo2, weapon3, ammo3)
end

function GetPlayerClass(amx, classId, team, skin, x, y, z, angle,
                        weapon1, ammo1, weapon2, ammo2, weapon3, ammo3)
    return writeSpawnInfo(amx, g_PlayerClasses and g_PlayerClasses[classId], team, skin,
        x, y, z, angle, weapon1, ammo1, weapon2, ammo2, weapon3, ammo3)
end

function GetVehicleSpawnInfo(amx, vehicle, x, y, z, angle, colour1, colour2)
    if not vehicle then return false end
    local vehicleData = g_Vehicles[getElemID(vehicle)]
    local spawn = vehicleData and vehicleData.spawninfo
    if not spawn then return false end
    writeMemFloat(amx, x, tonumber(spawn.x) or 0)
    writeMemFloat(amx, y, tonumber(spawn.y) or 0)
    writeMemFloat(amx, z, tonumber(spawn.z) or 0)
    writeMemFloat(amx, angle, tonumber(spawn.angle) or 0)
    amx.memDAT[colour1] = tonumber(vehicleData.color1) or 0
    amx.memDAT[colour2] = tonumber(vehicleData.color2) or 0
    return true
end

function GetPlayerSurfingPlayerObjectID(amx, player)
    -- mta-amx currently exposes global object surfing only.  Returning the
    -- standard invalid ID is safe and keeps weapon-config from false positives.
    return 65535
end

function IsValidTimer(amx, timerId)
    return timerId > 0 and amx.timers and isTimer(amx.timers[timerId]) or false
end

function CountRunningTimers(amx)
    local count = 0
    for _, timer in pairs(amx.timers or {}) do
        if isTimer(timer) then count = count + 1 end
    end
    return count
end

function IsPlayerSpawned(amx, player)
    return player and isElement(player) and not isPedDead(player) or false
end

function IsPlayerInDriveByMode(amx, player)
    return false
end

function IsPlayerTeleportAllowed(amx, player)
    return true
end

function IsAdminTeleportAllowed(amx)
    return true
end

function GetPlayerSpectateID(amx, player)
    return 65535
end

function BeginObjectSelecting(amx, player)
    return false
end

function EndObjectEditing(amx, player)
    return true
end

function PlayerTextDrawSetPos(amx, player, textdrawId, x, y)
    local textdraws = player and g_PlayerTextDraws[player]
    local textdraw = textdraws and textdraws[textdrawId]
    if not textdraw then return false end
    textdraw.x, textdraw.y = x, y
    return true
end

function IsValidCustomModel(amx, modelId)
    local models = modelsResource()
    if not models then return false end
    return call(models, "getBaseModel", modelId)
        or call(models, "getObjectBaseModel", modelId)
        or false
end

function AddCharModel(amx, baseModel, customModel, dff, txd)
    -- All shipped Kotnik/M-RP skins are pre-generated into MRP_MODELS and sent
    -- with the resource.  The Pawn artconfig registration is therefore a
    -- validation step; unknown/missing assets are rejected explicitly.
    local models = modelsResource()
    return models and call(models, "getBaseModel", customModel) and true or false
end

function GetVehicleSeats(amx, vehicle)
    if not vehicle then return 0 end
    local model = getElementModel(vehicle)
    local passengers = getVehicleMaxPassengers(model)
    return passengers and passengers + 1 or 1
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
g_SAMPSyscallPrototypes.PR_SendPacket = {'i', 'p', 'i', 'i', 'i'}
g_SAMPSyscallPrototypes.BS_GetNumberOfBytesUsed = {'i', 'r'}
g_SAMPSyscallPrototypes.BS_SetReadOffset = {'i', 'i'}
g_SAMPSyscallPrototypes.BS_ResetReadPointer = {'i'}
g_SAMPSyscallPrototypes.DB_Open = {'s', 'i'}
g_SAMPSyscallPrototypes.DB_ExecuteQuery = {'i', 's'}
g_SAMPSyscallPrototypes.DB_FreeResultSet = {'d'}
g_SAMPSyscallPrototypes.DB_GetRowCount = {'d'}
g_SAMPSyscallPrototypes.DB_SelectNextRow = {'d'}
g_SAMPSyscallPrototypes.DB_GetFieldString = {'d', 'i', 'r', 'i'}
g_SAMPSyscallPrototypes.DB_GetFieldIntByName = {'d', 's'}
g_SAMPSyscallPrototypes.DB_GetFieldFloatByName = {'d', 's'}
g_SAMPSyscallPrototypes.GetVehicleSpawnInfo = {'v', 'r', 'r', 'r', 'r', 'r', 'r'}
g_SAMPSyscallPrototypes.GetPlayerSurfingPlayerObjectID = {'p'}
g_SAMPSyscallPrototypes.GetPlayerClass = {'i', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r'}
g_SAMPSyscallPrototypes.GetSpawnInfo = {'p', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r', 'r'}
g_SAMPSyscallPrototypes.IsPlayerTeleportAllowed = {'p'}
g_SAMPSyscallPrototypes.IsAdminTeleportAllowed = {}
g_SAMPSyscallPrototypes.PlayerTextDrawSetPos = {'p', 'i', 'f', 'f'}
g_SAMPSyscallPrototypes.IsValidTimer = {'i'}
g_SAMPSyscallPrototypes.IsPlayerSpawned = {'p'}
g_SAMPSyscallPrototypes.GetPlayerSpectateID = {'p'}
g_SAMPSyscallPrototypes.EndObjectEditing = {'p'}
g_SAMPSyscallPrototypes.BeginObjectSelecting = {'p'}
g_SAMPSyscallPrototypes.IsValidCustomModel = {'i'}
g_SAMPSyscallPrototypes.AddCharModel = {'i', 'i', 's', 's'}
g_SAMPSyscallPrototypes.CountRunningTimers = {}
g_SAMPSyscallPrototypes.GetVehicleSeats = {'v'}
g_SAMPSyscallPrototypes.IsPlayerInDriveByMode = {'p'}

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
