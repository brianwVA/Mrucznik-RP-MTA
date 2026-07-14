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
    objectModels[customModel] = {
        base = baseModel,
        dff = assetPath(dff),
        txd = assetPath(txd),
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
