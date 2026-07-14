-- Mrucznik RP additions for SA-MP 0.3.DL model IDs.

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
    local models = getResourceFromName("mrp_models")
    if not models or getResourceState(models) ~= "running" then
        return model, false
    end
    local base = call(models, "getObjectBaseModel", model)
    if base then
        return base, model
    end
    if not tonumber(model) or model < 321 or model > 18630 then
        return 1337, false
    end
    return model, false
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
