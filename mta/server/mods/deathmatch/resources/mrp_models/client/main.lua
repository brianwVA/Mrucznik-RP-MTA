local loadedModels = {}
-- The complete SA-MP and Vice City catalog is loaded as a shared script before
-- this file.  Keeping it local avoids a multi-megabyte client event whose
-- serialization used to leave whole districts as invisible placeholders.
local objectModels = {}
for model, definition in pairs(MRP_OBJECT_MODELS or {}) do
    objectModels[model] = definition
end
local loadedObjectModels = {}
local objectMaterialShaders = {}
local pendingObjectModels = {}
local activeObjectModels = {}
local objectModelUsers = {}
local objectModelReleaseTimers = {}
local objectModelLastUsed = {}
local objectModelLoadQueue = {}
local objectModelLoadHead = 1
local objectModelLoadTail = 0
local queuedObjectModels = {}
local objectModelLoadTimer = false
local releaseObjectModel
local retryPendingObjectModels

-- A short release delay made longer drives repeatedly free and reload the same
-- COL/TXD/DFF files. Keep the complete Mrucznik map set warm for a normal
-- session; the cache remains bounded for any runtime registrations.
local OBJECT_MODEL_RELEASE_DELAY = 60 * 60 * 1000
local MAX_IDLE_OBJECT_MODELS = 128
local PREWARM_OBJECT_MODELS = 24
-- One COL/TXD/DFF replacement can briefly occupy the GTA streaming thread.
-- Spread dense-area loads across more frames instead of issuing 40 per second.
local OBJECT_MODEL_LOAD_INTERVAL = 100
-- Constant custom-object IDs referenced by the current Pawn source. Preloading
-- these while the player is still logging in moves disk parsing and model
-- replacement away from the first fast drive through each district.
local GAMEMODE_PREWARM_OBJECT_MODELS = {
    18651, 18632, 18648, 18649, 18647, 18650, 19836, 19939,
    19463, 19294, 19464, 19797, 18728, 18766, 19128, 19280,
    19300, 19377, 18716, 18747, 19302, 19326, 18652, 18653,
    18727, 19150, 19310, 19482, 18646, 18680, 18689, 18849,
    19311, 19328, 19608,
}
-- MTA's own guidance recommends about 170 for ordinary high-detail objects.
-- The previous extended value of 1000 forced large map sections to remain
-- visible and caused world/model streaming bursts while moving quickly.
local OBJECT_MODEL_DRAW_DISTANCE = 170

if type(engineSetAsynchronousLoading) == "function" then
    -- Respect the player's preference while avoiding first-use model stalls on
    -- current MTA clients.  The explicit load queue below still limits bursts.
    engineSetAsynchronousLoading(true, false)
end

local function littleEndianUInt32(data, position)
    local b1, b2, b3, b4 = data:byte(position, position + 3)
    if not b4 then return false end
    return b1 + b2 * 0x100 + b3 * 0x10000 + b4 * 0x1000000
end

local function loadEmbeddedObjectCOL(path)
    -- SA-MP 0.3.DL stores a raw COL chunk at the end of the Vice City DFF.
    -- MTA only auto-loads embedded collision for vehicles; custom objects need
    -- engineLoadCOL/engineReplaceCOL explicitly.
    local prefix = "assets/vc4samp/dff/"
    if type(path) ~= "string" or path:sub(1, #prefix) ~= prefix then
        return false, false
    end
    local file = fileOpen(path, true)
    if not file then return false, false end
    local data = fileRead(file, fileGetSize(file))
    fileClose(file)
    if not data then return false, false end

    local bestPosition, bestLength
    for _, signature in ipairs({ "COLL", "COL2", "COL3", "COL4" }) do
        local from = 1
        while true do
            local position = data:find(signature, from, true)
            if not position then break end
            local payloadLength = littleEndianUInt32(data, position + 4)
            local totalLength = payloadLength and payloadLength + 8 or 0
            local available = #data - position + 1
            -- Three source files are four zero bytes shorter than declared by
            -- their COL header. SA-MP tolerates it, so pad only that short tail.
            if totalLength > 8 and available <= totalLength and totalLength - available <= 4 then
                bestPosition, bestLength = position, totalLength
            end
            from = position + 1
        end
    end
    if not bestPosition then return false, false end
    local raw = data:sub(bestPosition)
    if #raw < bestLength then
        raw = raw .. string.rep("\0", bestLength - #raw)
    elseif #raw > bestLength then
        raw = raw:sub(1, bestLength)
    end
    return engineLoadCOL(raw), true
end

local function materialAssetPath(txdLib, txdName)
	local base = "assets/materials/" .. tostring(txdLib) .. "/" .. tostring(txdName)
	for _, extension in ipairs({ ".dds", ".png", ".jpg" }) do
		if fileExists(base .. extension) then return base .. extension end
	end
	return false
end

local function modelTexture(model, txdName)
	model = tonumber(model)
	if not model or model < 321 or model > 18630 then return false end
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
	pendingObjectModels[source] = nil
	if releaseObjectModel then releaseObjectModel(source, false) end
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
    -- A source pack can reference a custom skin whose DFF/TXD was never
    -- shipped. Use its declared stock base instead of making the player
    -- invisible or repeatedly attempting a missing disk load.
    if definition.fallback then
        return tonumber(definition.base) or false
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

local function destroyEngineAsset(asset)
    if isElement(asset) then destroyElement(asset) end
end

local function loadCustomObjectModel(customModel)
    customModel = tonumber(customModel)
    local definition = objectModels[customModel]
    if not definition then
        return false
    end
    local loaded = loadedObjectModels[customModel]
    if loaded then
        return loaded.runtimeModel
    end

    local baseModel = tonumber(definition.base) or 1337
    if baseModel < 321 or baseModel > 18630 then
        baseModel = 1337
    end
    local runtimeModel = engineRequestModel("object", baseModel)
    if not runtimeModel then
        outputDebugString("[MRP models] Brak wolnego ID obiektu " .. customModel, 1)
        return false
    end
    -- MTA requires custom object assets in COL -> TXD -> DFF order.
    local loadStartedAt = getTickCount()
    local col, hasEmbeddedCOL = false, false
    if definition.col then
        col = engineLoadCOL(definition.col)
    else
        col, hasEmbeddedCOL = loadEmbeddedObjectCOL(definition.dff)
    end
    local txd = engineLoadTXD(definition.txd)
    local dff = engineLoadDFF(definition.dff)
    if ((definition.col or hasEmbeddedCOL) and not col)
        or not txd
        or not dff
        or (col and not engineReplaceCOL(col, runtimeModel))
        or not engineImportTXD(txd, runtimeModel)
        or not engineReplaceModel(dff, runtimeModel)
    then
        engineFreeModel(runtimeModel)
        destroyEngineAsset(dff)
        destroyEngineAsset(txd)
        destroyEngineAsset(col)
        outputDebugString("[MRP models] Nie udało się załadować obiektu " .. customModel, 1)
        return false
    end
    local timeOn, timeOff = tonumber(definition.timeOn), tonumber(definition.timeOff)
    if timeOn and timeOff then
        engineSetModelVisibleTime(runtimeModel, timeOn, timeOff)
    end
    engineSetModelLODDistance(runtimeModel, OBJECT_MODEL_DRAW_DISTANCE)
    loadedObjectModels[customModel] = {
        runtimeModel = runtimeModel,
        col = col,
        txd = txd,
        dff = dff,
    }
    objectModelLastUsed[customModel] = getTickCount()
    local loadDuration = getTickCount() - loadStartedAt
    if loadDuration >= 20 then
        outputDebugString(string.format(
            "[MRP models] Wolne ladowanie modelu %d: %d ms",
            customModel, loadDuration
        ), 2)
    end
    return runtimeModel
end

local function freeCustomObjectModel(customModel)
    customModel = tonumber(customModel)
    local users = objectModelUsers[customModel]
    if users and next(users) then return false end
    local loaded = loadedObjectModels[customModel]
    if not loaded then return false end
    loadedObjectModels[customModel] = nil
    objectModelLastUsed[customModel] = nil
    engineFreeModel(loaded.runtimeModel)
    destroyEngineAsset(loaded.dff)
    destroyEngineAsset(loaded.txd)
    destroyEngineAsset(loaded.col)
    return true
end

local function cancelObjectModelRelease(customModel)
    local timer = objectModelReleaseTimers[customModel]
    if timer and isTimer(timer) then killTimer(timer) end
    objectModelReleaseTimers[customModel] = nil
end

local function trimIdleObjectModels()
    local idle = {}
    for customModel in pairs(loadedObjectModels) do
        local users = objectModelUsers[customModel]
        if not users or not next(users) then
            idle[#idle + 1] = customModel
        end
    end
    if #idle <= MAX_IDLE_OBJECT_MODELS then return end
    table.sort(idle, function(a, b)
        return (objectModelLastUsed[a] or 0) < (objectModelLastUsed[b] or 0)
    end)
    for index = 1, #idle - MAX_IDLE_OBJECT_MODELS do
        cancelObjectModelRelease(idle[index])
        freeCustomObjectModel(idle[index])
    end
end

local function scheduleObjectModelRelease(customModel)
    cancelObjectModelRelease(customModel)
    objectModelReleaseTimers[customModel] = setTimer(function(model)
        objectModelReleaseTimers[model] = nil
        freeCustomObjectModel(model)
    end, OBJECT_MODEL_RELEASE_DELAY, 1, customModel)
end

releaseObjectModel = function(object, resetPlaceholder)
    local customModel = activeObjectModels[object]
    if not customModel then return end
    activeObjectModels[object] = nil
    local users = objectModelUsers[customModel]
    if users then
        users[object] = nil
        if not next(users) then
            objectModelUsers[customModel] = nil
            objectModelLastUsed[customModel] = getTickCount()
            scheduleObjectModelRelease(customModel)
        end
    end
    if resetPlaceholder and isElement(object) then
        setElementAlpha(object, 0)
        setElementCollisionsEnabled(object, false)
        local loaded = loadedObjectModels[customModel]
        if loaded and getElementModel(object) == loaded.runtimeModel then
            setElementModel(object, 1337)
        end
    end
end

local function retainObjectModel(object, customModel)
    local active = activeObjectModels[object]
    if active == customModel then return end
    if active then releaseObjectModel(object, true) end
    activeObjectModels[object] = customModel
    objectModelUsers[customModel] = objectModelUsers[customModel] or {}
    objectModelUsers[customModel][object] = true
    objectModelLastUsed[customModel] = getTickCount()
    cancelObjectModelRelease(customModel)
end

local function hasPendingObjectModel(customModel)
    for object, pendingModel in pairs(pendingObjectModels) do
        if pendingModel == customModel and isElement(object) then return true end
    end
    return false
end

local function processObjectModelLoadQueue()
    objectModelLoadTimer = false
    local customModel
    if objectModelLoadHead <= objectModelLoadTail then
        customModel = objectModelLoadQueue[objectModelLoadHead]
        objectModelLoadQueue[objectModelLoadHead] = nil
        objectModelLoadHead = objectModelLoadHead + 1
    end
    if customModel then
        local preload = customModel.preload
        customModel = customModel.model
        queuedObjectModels[customModel] = nil
        if (preload or hasPendingObjectModel(customModel)) and objectModels[customModel]
            and not loadedObjectModels[customModel]
        then
            loadCustomObjectModel(customModel)
            trimIdleObjectModels()
        end
        if retryPendingObjectModels then retryPendingObjectModels(customModel) end
    end
    if objectModelLoadHead <= objectModelLoadTail then
        objectModelLoadTimer = setTimer(
            processObjectModelLoadQueue, OBJECT_MODEL_LOAD_INTERVAL, 1
        )
    else
        objectModelLoadQueue = {}
        objectModelLoadHead = 1
        objectModelLoadTail = 0
    end
end

local function queueObjectModelLoad(customModel, preload)
    if loadedObjectModels[customModel] or queuedObjectModels[customModel] then return end
    queuedObjectModels[customModel] = true
    objectModelLoadTail = objectModelLoadTail + 1
    objectModelLoadQueue[objectModelLoadTail] = {
        model = customModel,
        preload = preload and true or false,
    }
    if not objectModelLoadTimer or not isTimer(objectModelLoadTimer) then
        objectModelLoadTimer = setTimer(
            processObjectModelLoadQueue, OBJECT_MODEL_LOAD_INTERVAL, 1
        )
    end
end

local function prewarmCommonObjectModels()
    for _, customModel in ipairs(GAMEMODE_PREWARM_OBJECT_MODELS) do
        if objectModels[customModel] then
            queueObjectModelLoad(customModel, true)
        end
    end
    local counts = {}
    for _, object in ipairs(getElementsByType("object")) do
        local customModel = tonumber(getElementData(object, "mrp:customObjectModel"))
        if customModel and objectModels[customModel] then
            counts[customModel] = (counts[customModel] or 0) + 1
        end
    end
    local common = {}
    for customModel, count in pairs(counts) do
        common[#common + 1] = { model = customModel, count = count }
    end
    table.sort(common, function(a, b)
        if a.count == b.count then return a.model < b.model end
        return a.count > b.count
    end)
    for index = 1, math.min(PREWARM_OBJECT_MODELS, #common) do
        queueObjectModelLoad(common[index].model, true)
    end
end

function applyObjectModel(object, customModel)
    if not isElement(object) then
        return false
    end
    customModel = tonumber(customModel)
    if not customModel then
        return false
    end
    -- The server has to create a real GTA object while a SA-MP custom model is
    -- being resolved. Model 1337 is only that transport placeholder, not part
    -- of the map. Hide global and player objects before any asynchronous
    -- registry/model loading so a failed or delayed replacement never leaves
    -- rows of dumpsters visible in the world.
    setElementAlpha(object, 0)
    setElementCollisionsEnabled(object, false)
    local activeModel = activeObjectModels[object]
    if activeModel and activeModel ~= customModel then
        releaseObjectModel(object, true)
    end
    -- Streamer can create client-only player objects before the asynchronous
    -- model registry reaches the client. Remember those objects and retry once
    -- the matching definition is available; otherwise collision floors can
    -- remain as the temporary placeholder for the whole session.
    if not objectModels[customModel] then
        pendingObjectModels[object] = customModel
        return false
    end
    local loaded = loadedObjectModels[customModel]
    if not loaded then
        pendingObjectModels[object] = customModel
        queueObjectModelLoad(customModel)
        return false
    end
    local runtimeModel = loaded.runtimeModel
    -- Streamer sets the local model data and then calls this export explicitly.
    -- The data-change handler may therefore have applied the model already.
    -- setElementModel returns false for that harmless second call; treating it
    -- as a failure used to hide every correctly loaded VC object again.
    local applied = getElementModel(object) == runtimeModel
        or setElementModel(object, runtimeModel)
    if applied then
        pendingObjectModels[object] = nil
        retainObjectModel(object, customModel)
        -- PlayerObjects use an invisible, non-collidable 1337 placeholder.
        -- Reveal the element only after the requested model really exists.
        setElementAlpha(object, 255)
        setElementCollisionsEnabled(object, true)
    end
    return applied
end

retryPendingObjectModels = function(customModel)
    customModel = tonumber(customModel)
    for object, pendingModel in pairs(pendingObjectModels) do
        if not isElement(object) then
            pendingObjectModels[object] = nil
        elseif not customModel or pendingModel == customModel then
            applyObjectModel(object, pendingModel)
        end
    end
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
            if element then retainObjectModel(element, logicalModel) end
        end
    elseif logicalModel >= 0 and logicalModel <= 311 then
        element = createPed(logicalModel, 0, 0, -1000)
    elseif logicalModel >= 400 and logicalModel <= 611 then
        element = createVehicle(logicalModel, 0, 0, -1000)
    elseif logicalModel > 0 then
        element = createObject(logicalModel, 0, 0, -1000)
    end

    if element then
        setElementData(element, "mrp:modelPreview", true, false)
        setElementDimension(element, 65535)
        setElementCollisionsEnabled(element, false)
        setElementFrozen(element, true)
    end
    return element or false
end

local function applyModel(ped)
    if not isElement(ped) then
        return
    end
    local customModel = getElementData(ped, "mrp:customSkin")
    if not customModel then
        return
    end
    local runtimeModel = loadCustomModel(customModel)
    if runtimeModel then
        setElementModel(ped, runtimeModel)
    end
end

addEventHandler("onClientElementDataChange", root, function(dataName)
    local elementType = getElementType(source)
    if dataName == "mrp:customSkin" and (elementType == "player" or elementType == "ped") then
        applyModel(source)
    elseif dataName == "mrp:customObjectModel" and elementType == "object" then
        local customModel = getElementData(source, "mrp:customObjectModel")
        if not customModel then
            pendingObjectModels[source] = nil
            releaseObjectModel(source, true)
        elseif isElementStreamedIn(source) then
            applyObjectModel(source, customModel)
        end
    end
end)

addEventHandler("onClientElementStreamIn", root, function()
    local elementType = getElementType(source)
    if elementType == "player" or elementType == "ped" then
        applyModel(source)
    elseif getElementType(source) == "object" then
        local customModel = getElementData(source, "mrp:customObjectModel")
        if customModel then
            applyObjectModel(source, customModel)
        end
    end
end)

addEventHandler("onClientElementStreamOut", root, function()
    if getElementType(source) == "object" then
        pendingObjectModels[source] = nil
        releaseObjectModel(source, true)
    end
end)

addEventHandler("onClientResourceStart", resourceRoot, function()
    -- Avoid a long frame whenever a new district requests many GTA assets.
    -- The custom-object queue additionally limits replacements to one unique
    -- model per timer slice.
    engineSetAsynchronousLoading(true, false)
    triggerServerEvent("mrp:requestObjectModels", resourceRoot)
    for _, player in ipairs(getElementsByType("player")) do
        applyModel(player)
    end
    for _, ped in ipairs(getElementsByType("ped")) do
        applyModel(ped)
    end
end)

addEventHandler("onClientResourceStop", resourceRoot, function()
    -- engineRequestModel allocations survive a resource stop unless they are
    -- explicitly released. Repeated updates used to drain the client model
    -- pool and could make later VC districts disappear.
    if objectModelLoadTimer and isTimer(objectModelLoadTimer) then
        killTimer(objectModelLoadTimer)
    end
    for _, timer in pairs(objectModelReleaseTimers) do
        if isTimer(timer) then killTimer(timer) end
    end
    for customModel, loaded in pairs(loadedObjectModels) do
        loadedObjectModels[customModel] = nil
        objectModelLastUsed[customModel] = nil
        engineFreeModel(loaded.runtimeModel)
        destroyEngineAsset(loaded.dff)
        destroyEngineAsset(loaded.txd)
        destroyEngineAsset(loaded.col)
    end
    for _, runtimeModel in pairs(loadedModels) do
        engineFreeModel(runtimeModel)
    end
end)

addEvent("mrp:onObjectModelRegistered", true)
addEventHandler("mrp:onObjectModelRegistered", resourceRoot, function(customModel, definition)
    objectModels[tonumber(customModel)] = definition
    retryPendingObjectModels(customModel)
end)

addEvent("mrp:onObjectModelsReady", true)
addEventHandler("mrp:onObjectModelsReady", resourceRoot, function(models)
    -- Merge runtime AddSimpleModel registrations instead of replacing the
    -- deterministic shared catalog.  This also preserves the catalog if an
    -- older MTA build truncates a large event payload.
    for model, definition in pairs(models or {}) do
        objectModels[tonumber(model)] = definition
    end
    -- Warm the most common replacements while the player is still joining or
    -- selecting a class, not when the first fast vehicle reaches the district.
    prewarmCommonObjectModels()
    retryPendingObjectModels()
    for _, object in ipairs(getElementsByType("object")) do
        local customModel = getElementData(object, "mrp:customObjectModel")
        if customModel and isElementStreamedIn(object) then
            applyObjectModel(object, customModel)
        end
    end
end)
