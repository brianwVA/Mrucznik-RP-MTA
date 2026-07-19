function CreateObject(amx, model, x, y, z, rX, rY, rZ, drawDistance)
	local suppressed = mrpIsSuppressedLegacyObject(model, x, y, z)
	local runtimeModel, customModel
	if suppressed then
		runtimeModel, customModel = 1337, MRP_SUPPRESSED_OBJECT_MODEL
	else
		runtimeModel, customModel = mrpResolveObjectModel(model)
	end
	local obj = createObject(runtimeModel, x, y, z, rX, rY, rZ)
	if obj and customModel then
		-- Never synchronize the base 1337 placeholder as a visible world object.
		-- mrp_models reveals it client-side only after the custom DFF/TXD/COL has
		-- been loaded and applied successfully.
		setElementAlpha(obj, 0)
		setElementCollisionsEnabled(obj, false)
	end
	if not obj then
		obj = createObject(1337, x, y, z, rX, rY, rZ) -- Create a dummy object anyway since createobject can also be used to make camera attachments
		setElementAlpha(obj, 0)
		setElementCollisionsEnabled(obj, false)
		outputDebugString(string.format('[MTA AMX - WARNING]: Invalid model id %d (replaced with invisible and non-collidable), some object ids are not supported, consider updating your scripts', model))
	end
	if obj and not customModel and (not tonumber(model) or model < 321 or model > 18630) then
		setElementAlpha(obj, 0)
		setElementCollisionsEnabled(obj, false)
	end
	mrpApplyCustomObjectModel(obj, customModel)
	return addElem(g_Objects, obj)
end

g_MRPDynamicObjects = g_MRPDynamicObjects or {}

-- Incognito's SA-MP streamer keeps its item inventory under MTA, but its
-- player-object emission is not compatible with the AMX module.  Materialize
-- the inventory as real MTA objects while retaining the streamer's IDs in Pawn.
function MRP_MirrorStreamerObject(amx, dynamicID, model, x, y, z, rX, rY, rZ, world, interior, drawDistance)
	if not g_MRPMirrorObjectNativeSeen then
		g_MRPMirrorObjectNativeSeen = true
		outputDebugString(string.format('[MTA AMX] First streamer object mirror: id=%s model=%s pos=%.2f,%.2f,%.2f', tostring(dynamicID), tostring(model), tonumber(x) or 0, tonumber(y) or 0, tonumber(z) or 0), 3)
	end
	local previous = g_MRPDynamicObjects[dynamicID]
	if previous and isElement(previous) then
		if getElementData(previous, 'mrp:sourceObjectModel') == model then
			setElementPosition(previous, x, y, z)
			setElementRotation(previous, rX, rY, rZ)
			setElementDimension(previous, world and world >= 0 and world or 0)
			setElementInterior(previous, interior and interior >= 0 and interior or 0)
			return true
		end
		destroyElement(previous)
	end

	local suppressed = mrpIsSuppressedLegacyObject(model, x, y, z)
	local runtimeModel, customModel
	if suppressed then
		runtimeModel, customModel = 1337, MRP_SUPPRESSED_OBJECT_MODEL
	else
		runtimeModel, customModel = mrpResolveObjectModel(model)
	end

	local object = createObject(runtimeModel, x, y, z, rX, rY, rZ)
	if not object then
		object = createObject(1337, x, y, z, rX, rY, rZ)
		if object then
			setElementAlpha(object, 0)
			setElementCollisionsEnabled(object, false)
		end
	end
	if not object then return false end

	if customModel then
		setElementAlpha(object, 0)
		setElementCollisionsEnabled(object, false)
	end
	if not customModel and (not tonumber(model) or model < 321 or model > 18630) then
		setElementAlpha(object, 0)
		setElementCollisionsEnabled(object, false)
	end

	setElementDimension(object, world and world >= 0 and world or 0)
	setElementInterior(object, interior and interior >= 0 and interior or 0)
	setElementData(object, 'mrp:dynamicObjectID', dynamicID, false)
	setElementData(object, 'mrp:sourceObjectModel', model, false)
	mrpApplyCustomObjectModel(object, customModel)
	g_MRPDynamicObjects[dynamicID] = object
	return true
end

function MRP_DestroyStreamerObject(amx, dynamicID)
	local object = g_MRPDynamicObjects[dynamicID]
	if object and isElement(object) then
		destroyElement(object)
	end
	g_MRPDynamicObjects[dynamicID] = nil
	return true
end

function MRP_SetStreamerObjectPos(amx, dynamicID, x, y, z)
	local object = g_MRPDynamicObjects[dynamicID]
	if not object or not isElement(object) then return false end
	setElementPosition(object, x, y, z)
	return true
end

function MRP_SetStreamerObjectRot(amx, dynamicID, rX, rY, rZ)
	local object = g_MRPDynamicObjects[dynamicID]
	if not object or not isElement(object) then return false end
	setElementRotation(object, rX, rY, rZ)
	return true
end

function MRP_MoveStreamerObject(amx, dynamicID, x, y, z, speed, rX, rY, rZ)
	local object = g_MRPDynamicObjects[dynamicID]
	if not object or not isElement(object) or speed <= 0.0 then return false end
	local currentX, currentY, currentZ = getElementPosition(object)
	local time = getDistanceBetweenPoints3D(x, y, z, currentX, currentY, currentZ) / speed * 1000
	local currentRX, currentRY, currentRZ = getElementRotation(object)
	local moveRX = rX - currentRX
	local moveRY = rY - currentRY
	local moveRZ = rZ - currentRZ
	if rX <= -1000.0 then moveRX = 0.0 end
	if rY <= -1000.0 then moveRY = 0.0 end
	if rZ <= -1000.0 then moveRZ = 0.0 end
	moveObject(object, time, x, y, z, moveRX, moveRY, moveRZ)
	return true
end

function MRP_SetStreamerObjectMaterial(amx, dynamicID, index, model, txdLib, txdName, color)
	local object = g_MRPDynamicObjects[dynamicID]
	if not object or not isElement(object) or index < 0 or index > 15 then return false end
	local materials = getElementData(object, 'amx:materials') or {}
	materials[index] = { model = model, txdLib = txdLib, txdName = txdName, color = color }
	setElementData(object, 'amx:materials', materials, 'broadcast')
	return true
end

function AttachObjectToVehicle(amx, object, vehicle, offsetX, offsetY, offsetZ, rX, rY, rZ)
	return attachElements(object, vehicle, offsetX, offsetY, offsetZ, rX, rY, rZ)
end

function AttachObjectToObject(amx, object, attachtoid, offsetX, offsetY, offsetZ, rX, rY, rZ, syncRotation)
	return attachElements(object, attachtoid, offsetX, offsetY, offsetZ, rX, rY, rZ)
end

function AttachObjectToPlayer(amx, object, player, offsetX, offsetY, offsetZ, rX, rY, rZ)
	return attachElements(object, player, offsetX, offsetY, offsetZ, rX, rY, rZ)
end

function SetObjectPos(amx, object, x, y, z)
	return setElementPosition(object, x, y, z)
end

function GetObjectPos(amx, object, refX, refY, refZ)
	if not object then
		return false
	end
	local x, y, z = getElementPosition(object)
	writeMemFloat(amx, refX, x)
	writeMemFloat(amx, refY, y)
	writeMemFloat(amx, refZ, z)
	return true
end

function GetObjectRot(amx, object, refX, refY, refZ)
	if not object then
		return false
	end
	local rX, rY, rZ = getObjectRotation(object)
	writeMemFloat(amx, refX, rX)
	writeMemFloat(amx, refY, rY)
	writeMemFloat(amx, refZ, rZ)
	return true
end

function SetObjectRot(amx, object, rX, rY, rZ)
	if object then
		setObjectRotation(object, rX, rY, rZ)
	end
	return true
end

function GetObjectModel(amx, object)
	if object then
		return getElementData(object, "mrp:customObjectModel") or getElementModel(object)
	end
	return -1
end

function SetObjectNoCameraCol(amx, object)
	notImplemented('SetObjectNoCameraCol')
	return false
end

function IsValidObject(amx, objID)
	return g_Objects[objID] ~= nil
end

function DestroyObject(amx, object)
	if object then
		local objdata = g_Objects[getElemID(object)]
		if objdata and objdata.moving then
			if isTimer(objdata.moving.timer) then
				killTimer(objdata.moving.timer)
			end
		end
		removeElem(g_Objects, object)
		destroyElement(object)
	end
	return true
end

function MoveObject(amx, object, x, y, z, speed, rX, rY, rZ)
	if not object or speed <= 0.0 then
		return 0
	end

	local distance = getDistanceBetweenPoints3D(x, y, z, getElementPosition(object))
	local time = distance / speed * 1000

	-- We need relative rotation
	local cRotX, cRotY, cRotZ = getElementRotation(object)
	cRotX = rX - cRotX
	cRotY = rY - cRotY
	cRotZ = rZ - cRotZ

	-- -1000 or less means no rotation change, so set it to 0.0
	if rX <= -1000.0 then cRotX = 0.0 end
	if rY <= -1000.0 then cRotY = 0.0 end
	if rZ <= -1000.0 then cRotZ = 0.0 end

	moveObject(object, time, x, y, z, cRotX, cRotY, cRotZ)

	local objID = getElemID(object)
	local objdata = g_Objects[objID]

	if objdata then
		if objdata.moving and isTimer(objdata.moving.timer) then
			killTimer(objdata.moving.timer)
		end
		local timer = setTimer(procCallOnAll, time, 1, 'OnObjectMoved', objID)
		objdata.moving = { timer = timer }
	end

	return math.floor(time)
end

function StopObject(amx, object)
	local objdata = g_Objects[getElemID(object)]
	if objdata and objdata.moving then
		if isTimer(objdata.moving.timer) then
			killTimer(objdata.moving.timer)
		end
		objdata.moving = nil
	end
	return stopObject(object)
end

function IsObjectMoving(amx, object)
	return isObjectMoving(object)
end

function CreatePlayerObject(amx, player, model, x, y, z, rX, rY, rZ, drawDistance)
	if not g_PlayerObjects[player] then
		g_PlayerObjects[player] = {}
	end
	local objID = table.insert(g_PlayerObjects[player], {
		model = model,
		x = x, y = y, z = z,
		rx = rX, ry = rY, rz = rZ
	})
	local suppressed = mrpIsSuppressedLegacyObject(model, x, y, z)
	local runtimeModel, customModel
	if suppressed then
		runtimeModel, customModel = 1337, MRP_SUPPRESSED_OBJECT_MODEL
	else
		runtimeModel, customModel = mrpResolveObjectModel(model)
	end
	clientCall(player, 'CreatePlayerObject', objID, runtimeModel, x, y, z, rX, rY, rZ, customModel)
	return objID
end

function SetPlayerObjectPos(amx, player, objID, x, y, z)
	local obj = g_PlayerObjects[player] and g_PlayerObjects[player][objID]
	if not obj then
		return false
	end
	obj.x, obj.y, obj.z = x, y, z
	clientCall(player, 'SetPlayerObjectPos', objID, x, y, z)
	return true
end

function SetPlayerObjectRot(amx, player, objID, rX, rY, rZ)
	local obj = g_PlayerObjects[player] and g_PlayerObjects[player][objID]
	if not obj then
		return false
	end
	obj.rx, obj.ry, obj.rz = rX, rY, rZ
	clientCall(player, 'SetPlayerObjectRot', objID, rX, rY, rZ)
	return true
end

local function getPlayerObjectPos(amx, player, objID)
	local obj = g_PlayerObjects[player] and g_PlayerObjects[player][objID]
	if not obj then
		return false
	end

	if obj.moving then
		local curtick = getTickCount()
		if curtick >= obj.moving.starttick + obj.moving.duration then
			obj.x, obj.y, obj.z = obj.moving.x, obj.moving.y, obj.moving.z
			obj.moving = nil

			return obj.x, obj.y, obj.z
		else
			local factor = (curtick - obj.moving.starttick) / obj.moving.duration
			factor = math.max(0, math.min(1, factor))

			local x = obj.x + (obj.moving.x - obj.x) * factor
			local y = obj.y + (obj.moving.y - obj.y) * factor
			local z = obj.z + (obj.moving.z - obj.z) * factor

			return x, y, z
		end
	else
		return obj.x, obj.y, obj.z
	end
end

function GetPlayerObjectPos(amx, player, objID, refX, refY, refZ)
	local x, y, z = getPlayerObjectPos(amx, player, objID)
	if not x then
		return false
	end
	writeMemFloat(amx, refX, x)
	writeMemFloat(amx, refY, y)
	writeMemFloat(amx, refZ, z)
	return true
end

function GetPlayerObjectRot(amx, player, objID, refX, refY, refZ)
	local obj = g_PlayerObjects[player] and g_PlayerObjects[player][objID]
	if not obj then
		return false
	end
	writeMemFloat(amx, refX, obj.rx)
	writeMemFloat(amx, refY, obj.ry)
	writeMemFloat(amx, refZ, obj.rz)
	return true
end

function GetPlayerObjectModel(amx, player, objID)
	if not player then return 0 end

	local obj = g_PlayerObjects[player] and g_PlayerObjects[player][objID]
	if not obj then return -1 end

	return obj.model
end

function SetPlayerObjectNoCameraCol(amx, player, objID)
	notImplemented('SetPlayerObjectNoCameraCol')
	return false
end

function IsValidPlayerObject(amx, player, objID)
	return g_PlayerObjects[player] and g_PlayerObjects[player][objID] and true
end

function DestroyPlayerObject(amx, player, objID)
	local obj = g_PlayerObjects[player] and g_PlayerObjects[player][objID]
	if obj then
		if obj.moving and isTimer(obj.moving.timer) then
			killTimer(obj.moving.timer)
		end
		g_PlayerObjects[player][objID] = nil
		clientCall(player, 'DestroyPlayerObject', objID)
	end
	return true
end

function MovePlayerObject(amx, player, objID, x, y, z, speed, rX, rY, rZ)
	local obj = g_PlayerObjects[player] and g_PlayerObjects[player][objID]
	if not obj or speed <= 0.0 then
		return 0
	end
	local curX, curY, curZ = getPlayerObjectPos(amx, player, objID)
	local distance = getDistanceBetweenPoints3D(x, y, z, curX, curY, curZ)
	local duration = distance / speed * 1000
	if obj.moving and isTimer(obj.moving.timer) then
		killTimer(obj.moving.timer)
	end
	obj.x, obj.y, obj.z = curX, curY, curZ
	local timer = setTimer(procCallOnAll, duration, 1, 'OnPlayerObjectMoved', getElemID(player), objID)
	obj.moving = { x = x, y = y, z = z, starttick = getTickCount(), duration = duration, timer = timer }
	clientCall(player, 'MovePlayerObject', objID, x, y, z, speed, rX, rY, rZ)
	return math.floor(duration)
end

function StopPlayerObject(amx, player, objID)
	local obj = g_PlayerObjects[player] and g_PlayerObjects[player][objID]
	if not obj then
		return false
	end
	if obj.moving then
		local moving = obj.moving
		obj.x, obj.y, obj.z = getPlayerObjectPos(amx, player, objID)
		if isTimer(moving.timer) then
			killTimer(moving.timer)
		end
		obj.moving = nil
	end
	clientCall(player, 'StopPlayerObject', objID)
	return true
end

function IsPlayerObjectMoving(amx, player, objID)
	local obj = g_PlayerObjects[player] and g_PlayerObjects[player][objID]
	if not obj or not obj.moving then
		return false
	end

	local curtick = getTickCount()
	if curtick >= obj.moving.starttick + obj.moving.duration then
		obj.moving = nil
		return false
	end

	return true
end

function SetObjectMaterialText(amx, object, text, index, size, fontName, fontSize, bold, fontColor, backColor, alignment)
	notImplemented('SetObjectMaterialText')
	return false
end

function SetPlayerObjectMaterialText(amx, player, objID, text, index, size, fontName, fontSize, bold, fontColor, backColor, alignment)
	notImplemented('SetPlayerObjectMaterialText')
	return false
end

-- AttachPlayerObjectToPlayer client
-- AttachPlayerObjectToVehicle client

function SetObjectsDefaultCameraCol(amx, disable)
	notImplemented('SetObjectsDefaultCameraCol')
	return false
end

function EditObject(amx, player, object)
	notImplemented('EditObject')
	return false
end

function EditPlayerObject(amx, player, objID)
	notImplemented('EditPlayerObject')
	return false
end

function SetObjectMaterial(amx, object, index, model, txdLib, txdName, color)
	if not object or index < 0 or index > 15 then return false end
	local materials = getElementData(object, 'amx:materials') or {}
	materials[index] = { model = model, txdLib = txdLib, txdName = txdName, color = color }
	-- Synchronize the description so late joiners and streamed-in objects can
	-- rebuild the equivalent SA-MP material shader client-side.
	setElementData(object, 'amx:materials', materials, 'broadcast')
	return true
end

function SetPlayerObjectMaterial(amx, player, objID, index, model, txdLib, txdName, color)
	local obj = g_PlayerObjects[player] and g_PlayerObjects[player][objID]
	if not obj or index < 0 or index > 15 then return false end
	obj.materials = obj.materials or {}
	obj.materials[index] = { model = model, txdLib = txdLib, txdName = txdName, color = color }
	clientCall(player, 'SetPlayerObjectMaterial', objID, index, model, txdLib, txdName, color)
	return true
end
