function getBaseModel(customModel)
    local definition = MRP_MODELS[tonumber(customModel)]
    return definition and definition.base or false
end

local objectModels = {}
for model, definition in pairs(MRP_OBJECT_MODELS or {}) do
    objectModels[model] = definition
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
        outputDebugString(string.format(
            "[MRP models] Pomijam model %d: brak pliku %s%s",
            customModel,
            not fileExists(dffPath) and dffPath or "",
            not fileExists(txdPath) and (not fileExists(dffPath) and ", " or "") .. txdPath or ""
        ), 2)
        return false
    end
    objectModels[customModel] = {
        base = baseModel,
        dff = dffPath,
        txd = txdPath,
        col = false,
        world = tonumber(virtualWorld) or -1,
        timeOn = tonumber(timeOn),
        timeOff = tonumber(timeOff),
    }
    triggerClientEvent(root, "mrp:onObjectModelRegistered", resourceRoot, customModel, objectModels[customModel])
    return true
end

function getObjectBaseModel(customModel)
    local definition = objectModels[tonumber(customModel)]
    return definition and definition.base or false
end

addEvent("mrp:requestObjectModels", true)
addEventHandler("mrp:requestObjectModels", resourceRoot, function()
    triggerClientEvent(client, "mrp:onObjectModelsReady", resourceRoot, objectModels)
end)
