-- M-RP additions for SA-MP 0.3.DL model IDs.

-- The old WPS decoration contains nine stock BinNt07_LA objects placed as a
-- repeated row across the public road. Keep the upstream submodule untouched,
-- but suppress those exact legacy placements in the MTA compatibility layer.
-- The sentinel follows the normal custom-model path, which guarantees that the
-- transport object remains invisible and non-collidable on every client.
MRP_SUPPRESSED_OBJECT_MODEL = -2147483647
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
    if tonumber(model) ~= 1337 then return false end
    x, y, z = tonumber(x), tonumber(y), tonumber(z)
    if not x or not y or not z then return false end
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
    local models = modelsResource()
    if not models then
        return 0
    end
    return call(models, "registerObjectModel", customModel, baseModel, dff, txd, virtualWorld) and 1 or 0
end

function AddSimpleModelTimed(amx, virtualWorld, baseModel, customModel, dff, txd, timeOn, timeOff)
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
