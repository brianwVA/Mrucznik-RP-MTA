function getBaseModel(customModel)
    local definition = MRP_MODELS[tonumber(customModel)]
    return definition and definition.base or false
end

local objectModels = {}
for model, definition in pairs(MRP_OBJECT_MODELS or {}) do
    objectModels[model] = definition
end
local runtimeObjectModels = {}

local function isSharedDefinition(customModel, definition)
    local shared = (MRP_OBJECT_MODELS or {})[customModel]
    if not shared then return false end
    return tonumber(shared.base) == tonumber(definition.base)
        and shared.dff == definition.dff
        and shared.txd == definition.txd
        and tonumber(shared.world or -1) == tonumber(definition.world or -1)
        and tonumber(shared.timeOn) == tonumber(definition.timeOn)
        and tonumber(shared.timeOff) == tonumber(definition.timeOff)
end

local function assetPath(path)
    path = tostring(path):gsub("\\", "/"):gsub("^/+", "")
    if path:sub(1, 7) == "assets/" then
        return path
    end
    return "assets/" .. path
end

function registerObjectModel(customModel, baseModel, dff, txd, virtualWorld, timeOn, timeOff)
    customModel = tonumber(customModel)
    baseModel = tonumber(baseModel)
    if not customModel or not baseModel then
        return false
    end
    -- AddSimpleModel commonly uses SA-MP 0.3.DL objects (for example 19379)
    -- as replacement bases.  Those IDs do not exist in GTA:SA/MTA and are
    -- rejected by engineRequestModel.  The DFF replaces the base completely,
    -- therefore a small stock object is a safe allocation template.
    if baseModel < 321 or baseModel > 18630 then
        baseModel = 1337
    end

    local dffPath = assetPath(dff)
    local txdPath = assetPath(txd)
    -- Some releases of the Vice City pack contain duplicate model IDs whose
    -- later definition references files that were not shipped.  Do not
    -- overwrite an earlier working definition with an unloadable one.
    if not fileExists(dffPath) or not fileExists(txdPath) then
        -- The generated shared registry can also repair old IDE filenames
        -- (for example subcrates.txd -> subcratesvc.txd).  In that case the
        -- model is already usable and the legacy Pawn registration is a
        -- harmless duplicate, not a missing model.
        if objectModels[customModel] then
            return true
        end
        outputDebugString(string.format(
            "[MRP models] Pomijam model %d: brak pliku %s%s",
            customModel,
            not fileExists(dffPath) and dffPath or "",
            not fileExists(txdPath) and (not fileExists(dffPath) and ", " or "") .. txdPath or ""
        ), 2)
        return false
    end
    local definition = {
        base = baseModel,
        dff = dffPath,
        txd = txdPath,
        col = false,
        world = tonumber(virtualWorld) or -1,
        timeOn = tonumber(timeOn),
        timeOff = tonumber(timeOff),
    }
    objectModels[customModel] = definition
    if isSharedDefinition(customModel, definition) then
        runtimeObjectModels[customModel] = nil
    else
        runtimeObjectModels[customModel] = definition
    end
    triggerClientEvent(root, "mrp:onObjectModelRegistered", resourceRoot, customModel, definition)
    return true
end

function getObjectBaseModel(customModel)
    local definition = objectModels[tonumber(customModel)]
    return definition and definition.base or false
end

addEvent("mrp:requestObjectModels", true)
addEventHandler("mrp:requestObjectModels", resourceRoot, function()
    -- SA-MP and Vice City definitions are already present in the shared Lua
    -- catalog.  Sending that multi-megabyte table in one event was unreliable
    -- and left whole VC districts invisible.  Only genuinely dynamic overrides
    -- need to cross the network for a player who joins later.
    triggerClientEvent(client, "mrp:onObjectModelsReady", resourceRoot, runtimeObjectModels)
end)
