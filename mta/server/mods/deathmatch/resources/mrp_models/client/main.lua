local loadedModels = {}
local objectModels = {}
local loadedObjectModels = {}
local objectMaterialShaders = {}

local function materialAssetPath(txdLib, txdName)
	local base = "assets/materials/" .. tostring(txdLib) .. "/" .. tostring(txdName)
	for _, extension in ipairs({ ".dds", ".png", ".jpg" }) do
		if fileExists(base .. extension) then return base .. extension end
	end
	return false
end

local function modelTexture(model, txdName)
	model = tonumber(model)
	if not model or model < 1 then return false end
	local textureName = tostring(txdName)
	local textures = engineGetModelTextures(model, textureName)
	if not textures then return false end
	if textures[textureName] then return textures[textureName] end
	local expected = textureName:lower()
	for name, texture in pairs(textures) do
		if tostring(name):lower() == expected then return texture end
	end
	return false
end

local function materialColor(color)
	color = tonumber(color) or 0
	if color == 0 then return 1, 1, 1, 1 end
	if color < 0 then color = color + 0x100000000 end
	local alpha = math.floor(color / 0x1000000) % 0x100
	local red = math.floor(color / 0x10000) % 0x100
	local green = math.floor(color / 0x100) % 0x100
	local blue = color % 0x100
	return red / 255, green / 255, blue / 255, alpha / 255
end

function applyObjectMaterial(object, index, model, txdLib, txdName, color)
	if not isElement(object) then return false end
	index = tonumber(index) or 0
	local textures = engineGetModelTextureNames(getElementModel(object)) or {}
	local sourceTexture = textures[index + 1]
	if not sourceTexture then return false end
	local asset = materialAssetPath(txdLib, txdName)
	local texture = asset and dxCreateTexture(asset, "argb", true, "clamp")
	local ownsTexture = texture and true or false
	if not texture then texture = modelTexture(model, txdName) end
	if not texture then return false end

	objectMaterialShaders[object] = objectMaterialShaders[object] or {}
	local previous = objectMaterialShaders[object][index]
	if previous then
		engineRemoveShaderFromWorldTexture(previous.shader, previous.sourceTexture, object)
		if isElement(previous.shader) then destroyElement(previous.shader) end
		if previous.ownsTexture and isElement(previous.texture) then destroyElement(previous.texture) end
	end
	local shader = dxCreateShader("client/material_replace.fx", 0, 0, false, "object")
	if not shader or not texture then
		if isElement(shader) then destroyElement(shader) end
		if ownsTexture and isElement(texture) then destroyElement(texture) end
		return false
	end
	dxSetShaderValue(shader, "replacementTexture", texture)
	dxSetShaderValue(shader, "materialColor", materialColor(color))
	engineApplyShaderToWorldTexture(shader, sourceTexture, object)
	objectMaterialShaders[object][index] = {
		shader = shader,
		texture = texture,
		ownsTexture = ownsTexture,
		sourceTexture = sourceTexture,
	}
	return true
end

addEventHandler("onClientElementDestroy", root, function()
	local materials = objectMaterialShaders[source]
	if not materials then return end
	for _, material in pairs(materials) do
		if isElement(material.shader) then destroyElement(material.shader) end
		if material.ownsTexture and isElement(material.texture) then destroyElement(material.texture) end
	end
	objectMaterialShaders[source] = nil
end)

local function loadCustomModel(customModel)
    local definition = MRP_MODELS[tonumber(customModel)]
    if not definition then
        return false
    end
    if loadedModels[customModel] then
        return loadedModels[customModel]
    end

    local runtimeModel = engineRequestModel("ped", definition.base)
    if not runtimeModel then
        outputDebugString("[MRP models] Brak wolnego ID dla modelu " .. customModel, 1)
        return false
    end
    local txd = engineLoadTXD(definition.txd)
    local dff = engineLoadDFF(definition.dff)
    if not txd or not dff or not engineImportTXD(txd, runtimeModel) or not engineReplaceModel(dff, runtimeModel) then
        engineFreeModel(runtimeModel)
        outputDebugString("[MRP models] Nie udało się załadować modelu " .. customModel, 1)
        return false
    end
    loadedModels[customModel] = runtimeModel
    return runtimeModel
end

local function loadCustomObjectModel(customModel)
    customModel = tonumber(customModel)
    local definition = objectModels[customModel]
    if not definition then
        return false
    end
    if loadedObjectModels[customModel] then
        return loadedObjectModels[customModel]
    end

    local runtimeModel = engineRequestModel("object", definition.base)
    if not runtimeModel then
        outputDebugString("[MRP models] Brak wolnego ID obiektu " .. customModel, 1)
        return false
    end
    local txd = engineLoadTXD(definition.txd)
    local dff = engineLoadDFF(definition.dff)
    if not txd or not dff or not engineImportTXD(txd, runtimeModel) or not engineReplaceModel(dff, runtimeModel) then
        engineFreeModel(runtimeModel)
        outputDebugString("[MRP models] Nie udało się załadować obiektu " .. customModel, 1)
        return false
    end
    loadedObjectModels[customModel] = runtimeModel
    return runtimeModel
end

function applyObjectModel(object, customModel)
    if not isElement(object) then
        return false
    end
    local runtimeModel = loadCustomObjectModel(customModel)
    if not runtimeModel then
        return false
    end
    return setElementModel(object, runtimeModel)
end

function createPreviewElement(logicalModel)
    logicalModel = tonumber(logicalModel)
    if not logicalModel then
        return false
    end

    local element
    if MRP_MODELS[logicalModel] then
        local runtimeModel = loadCustomModel(logicalModel)
        if runtimeModel then
            element = createPed(runtimeModel, 0, 0, -1000)
        end
    elseif objectModels[logicalModel] then
        local runtimeModel = loadCustomObjectModel(logicalModel)
        if runtimeModel then
            element = createObject(runtimeModel, 0, 0, -1000)
        end
    elseif logicalModel >= 0 and logicalModel <= 311 then
        element = createPed(logicalModel, 0, 0, -1000)
    elseif logicalModel >= 400 and logicalModel <= 611 then
        element = createVehicle(logicalModel, 0, 0, -1000)
    elseif logicalModel > 0 then
        element = createObject(logicalModel, 0, 0, -1000)
    end

    if element then
        setElementDimension(element, 65535)
        setElementCollisionsEnabled(element, false)
        setElementFrozen(element, true)
    end
    return element or false
end

local function applyModel(player)
    if not isElement(player) then
        return
    end
    local customModel = getElementData(player, "mrp:customSkin")
    if not customModel then
        return
    end
    local runtimeModel = loadCustomModel(customModel)
    if runtimeModel then
        setElementModel(player, runtimeModel)
    end
end

addEventHandler("onClientElementDataChange", root, function(dataName)
    if dataName == "mrp:customSkin" and getElementType(source) == "player" then
        applyModel(source)
    elseif dataName == "mrp:customObjectModel" and getElementType(source) == "object" then
        applyObjectModel(source, getElementData(source, "mrp:customObjectModel"))
    end
end)

addEventHandler("onClientElementStreamIn", root, function()
    if getElementType(source) == "player" then
        applyModel(source)
    elseif getElementType(source) == "object" then
        local customModel = getElementData(source, "mrp:customObjectModel")
        if customModel then
            applyObjectModel(source, customModel)
        end
    end
end)

addEventHandler("onClientResourceStart", resourceRoot, function()
    triggerServerEvent("mrp:requestObjectModels", resourceRoot)
    for _, player in ipairs(getElementsByType("player")) do
        applyModel(player)
    end
end)

addEvent("mrp:onObjectModelRegistered", true)
addEventHandler("mrp:onObjectModelRegistered", resourceRoot, function(customModel, definition)
    objectModels[tonumber(customModel)] = definition
end)

addEvent("mrp:onObjectModelsReady", true)
addEventHandler("mrp:onObjectModelsReady", resourceRoot, function(models)
    objectModels = models or {}
    for _, object in ipairs(getElementsByType("object")) do
        local customModel = getElementData(object, "mrp:customObjectModel")
        if customModel then
            applyObjectModel(object, customModel)
        end
    end
end)
