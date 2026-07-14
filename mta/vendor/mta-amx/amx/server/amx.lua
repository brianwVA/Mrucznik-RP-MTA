g_LoadedAMXs = {}
g_Events = {}

g_Players = {}
g_Bots = {}
g_Vehicles = {}
g_Objects = {}
g_PlayerObjects = {}
g_Pickups = {}
g_Markers = {}
g_Actors = {}
g_GangZones = {}
g_OpenDBs = {}
g_DBResults = {}
g_Menus = {}
g_TextDraws = {}
g_PlayerTextDraws = {}
g_TextLabels = {}
g_BlockedIPs = {}
g_SVars = {}

function initGameModeGlobals()
	g_PlayerClasses = {}
	g_Teams = setmetatable({}, { __index = function(t, k) t[k] = createTeam('Team ' .. (k + 1)) return t[k] end })
	g_FriendlyFire = false
	g_PlayerMarkersMode = 1
	g_PlayerMarkerRadius = false
	g_ShowZoneNames = false
	g_GlobalChatRadius = false
	g_UseCJWalk = false
	g_ShowNameTags = true
	g_NameTagsRadius = 70
	g_NameTagsLOS = true
end

addEventHandler('onResourceStart', resourceRoot,
	function()
		if not amxVersion then
			outputDebugString('The amx module (king.dll/so) isn\'t loaded. It is required for amx to function. Please add it to your server config and restart your server.', 1)
			return
		end

		table.each(getElementsByType('player'), joinHandler)

		local plugins = get('amx.plugins')
		if plugins then
			table.each(plugins:split(), amxLoadPlugin)
		end

		local filterscripts = get('amx.filterscripts')
		if filterscripts then
			filterscripts = filterscripts:split()
			for i, filterscript in ipairs(filterscripts) do
				local filterres = getResourceFromName('amx-fs-' .. filterscript)
				if filterres then
					if getResourceState(filterres) == 'running' then
						restartResource(filterres)
					else
						startResource(filterres)
					end
				else
					outputDebugString('Unable to load filterscript \'' .. filterscript .. '\'.', 2)
				end
			end
		end

		local scoreboard = getResourceFromName('scoreboard')
		if getResourceState(scoreboard) == 'running' then
			exports.scoreboard:scoreboardForceTeamsHidden(true)
			exports.scoreboard:scoreboardAddColumn('Score')
		end

		toggleSpecialProperties()
		toggleGlitches()
	end,
	false
)

local function loadResourceAMXs(res)
	local amxFiles = getResourceAMXFiles(res)
	if amxFiles and #amxFiles > 0 then
		table.each(amxFiles, loadAMX, res)
	end
end
addEventHandler('onResourceStart', root, loadResourceAMXs)

-- MTA can mark an AMX map resource as running while it is still changing from
-- the default gamemode to this compatibility resource. In that case its
-- onResourceStart event predates the handler above and the Pawn file would be
-- skipped. Load any already-running non-filterscript AMX resource once the
-- compatibility layer itself has finished starting.
addEventHandler('onResourceStart', resourceRoot,
	function()
		for _, res in ipairs(getResources()) do
			local name = getResourceName(res)
			if getResourceState(res) == 'running' and name:match('^amx%-') and not name:match('^amx%-fs%-') then
				loadResourceAMXs(res)
			end
		end
	end,
	false
)

function loadAMX(fileName, res)
	local resName = getResourceName(res)
	if not resName:match('^amx%-') then
		outputDebugString('Unable to load \'' .. fileName .. '\', resource name must start with \'amx-\'.', 1)
		return false
	end
	outputDebugString('Loading \'' .. fileName .. '\'.')
	local amx = { name = fileName:match('(.*)%.'), res = res }
	if resName:match('^amx%-fs%-') then
		amx.type = 'filterscript'
	else
		amx.type = 'gamemode'
	end

	local hAMX = fileOpen(':' .. getResourceName(res) .. '/' .. fileName, true)
	if not hAMX then
		outputDebugString('Error opening \'' .. fileName .. '\'.', 1)
		return false
	end

	-- read header
	amx.flags = readWORDAt(hAMX, 8)
	amx.COD = readDWORDAt(hAMX, 0xC)
	amx.DAT = readDWORD(hAMX)
	amx.HEA = readDWORD(hAMX)
	amx.STP = readDWORD(hAMX)
	amx.main = readDWORD(hAMX)
	amx.publics = readDWORD(hAMX)
	amx.natives = readDWORD(hAMX)
	amx.libraries = readDWORD(hAMX)

	-- read tables with names of public and syscall functions
	amx.publics = readPrefixTable(hAMX, amx.publics, amx.natives - amx.publics, true)
	amx.natives = readPrefixTable(hAMX, amx.natives, amx.libraries - amx.natives, false)
	amx.libraries = nil

	fileClose(hAMX)

	local alreadyGameModeRunning = getRunningGameMode() and true
	local alreadySyncingWeapons = isWeaponSyncingNeeded()
	if alreadyGameModeRunning and amx.type == 'gamemode' then
		outputDebugString('Unable to load \'' .. fileName .. '\', a gamemode is already running.', 1)
		return false
	end

	amx.cptr = amxLoad(getResourceName(res), amx.name .. '.amx')
	if not amx.cptr then
		outputDebugString('Error loading \'' .. fileName .. '\'.', 1)
		return false
	end

	-- set up reading/writing of code and data section
	amx.memCOD = setmetatable({ amx = amx.cptr }, { __index = amxMTReadCODCell })
	amx.memDAT = setmetatable({ amx = amx.cptr }, { __index = amxMTReadDATCell, __newindex = amxMTWriteDATCell })

	g_LoadedAMXs[amx.name] = amx

	amx.timers = {}

	-- run initialization
	if amx.type == 'gamemode' then
		clientCall(root, 'gamemodeLoad')
		setWeather(10)
		toggleSpecialProperties()
		toggleGlitches()
		initGameModeGlobals()
		ShowPlayerMarkers(amx, g_PlayerMarkersMode)
		-- The exact Mrucznik map synchronously registers thousands of Vice City
		-- models and collision objects.  That legitimate one-time initialization
		-- exceeds MTA's Lua watchdog, although Pawn is still making progress.
		-- Suspend the hook only for this trusted, pinned callback and restore it
		-- immediately afterwards.
		local watchdogHook, watchdogMask, watchdogCount = debug.gethook()
		debug.sethook(nil)
		local initResult
		local ok, initError = xpcall(
			function() initResult = procCallOnAll('OnGameModeInit') end,
			debug.traceback
		)
		-- MTA exposes its native watchdog as the string "external hook".
		-- Lua cannot reinstall that sentinel with debug.sethook; it is managed by
		-- the host.  Restore only ordinary Lua hooks returned as functions.
		if type(watchdogHook) == 'function' then
			debug.sethook(watchdogHook, watchdogMask, watchdogCount)
		end
		if not ok then error(initError, 0) end
		table.each(g_Players, 'elem', gameModeInit)
	else
		procCallInternal(amx, 'OnFilterScriptInit')
	end
	-- Filterscripts without a Pawn main() store AMX_EXEC_MAIN (0xffffffff)
	-- in the header. Their OnFilterScriptInit callback has already run, so do
	-- not pass that sentinel back as a public-function index.
	if amx.main ~= 0xffffffff then
		procCallInternal(amx, amx.main)
	end

	for id, player in pairs(g_Players) do
		procCallInternal(amx, 'OnPlayerConnect', id)
	end

	if not alreadySyncingWeapons and isWeaponSyncingNeeded(amx) then
		clientCall(root, 'enableWeaponSyncing', true)
	end
	triggerEvent('onAMXStart', getResourceRootElement(res), amx.res, amx.name)
	return amx
end
addEvent('onAMXStart')

function destroyGlobalElements()
	for i, playerdata in pairs(g_Players) do
		if isTimer(playerdata.updatetimer) then
			killTimer(playerdata.updatetimer)
		end
		playerdata.updatetimer = nil
		playerdata.menu = nil
	end

	for i, vehinfo in pairs(g_Vehicles) do
		if isTimer(vehinfo.respawntimer) then
			killTimer(vehinfo.respawntimer)
		end
		vehinfo.respawntimer = nil
	end

	for id, objdata in pairs(g_Objects) do
		if objdata.moving and isTimer(objdata.moving.timer) then
			killTimer(objdata.moving.timer)
		end
		objdata.moving = nil
	end

	for player, objects in pairs(g_PlayerObjects) do
		for objID, obj in pairs(objects) do
			if obj.moving and isTimer(obj.moving.timer) then
				killTimer(obj.moving.timer)
			end
		end
		g_PlayerObjects[player] = nil
	end

	for i, elemtype in ipairs({ g_Menus, g_TextLabels, g_TextDraws, g_PlayerTextDraws }) do
		for id, data in pairs(elemtype) do
			elemtype[id] = nil
		end
	end

	for i, elemtype in ipairs({ g_Vehicles, g_Pickups, g_Objects, g_GangZones, g_Markers, g_Bots, g_Actors }) do
		for id, data in pairs(elemtype) do
			removeElem(elemtype, data.elem)

			if isElement(data.elem) then
				destroyElement(data.elem)
			end
		end
	end

	for teamID, team in pairs(g_Teams) do
		if isElement(team) then
			destroyElement(team)
		end
		g_Teams[teamID] = nil
	end
end

function unloadAMX(amx, notifyClient)
	outputDebugString('Unloading \'' .. amx.name .. '.amx\'.')

	if amx.type == 'gamemode' then
		procCallInternal(amx, 'OnGameModeExit')
		fadeCamera(root, false, 0)
		ShowPlayerMarkers(amx, 0)
		destroyGlobalElements()

		if notifyClient ~= false then
			clientCall(root, 'gamemodeUnload')
		end

	elseif amx.type == 'filterscript' then
		procCallInternal(amx, 'OnFilterScriptExit')
	end

	amxUnload(amx.cptr)

	table.each(amx.timers, killTimer)

	g_LoadedAMXs[amx.name] = nil
	if not isWeaponSyncingNeeded() then
		clientCall(root, 'enableWeaponSyncing', false)
	end
	if getResourceState(amx.res) == 'running' then
		stopResource(amx.res)
	end
	triggerEvent('onAMXStop', getResourceRootElement(amx.res), amx.res, amx.name)
end
addEvent('onAMXStop')

addEventHandler('onResourceStop', root,
	function(res)
		local amxs = getResourceAMXFiles(res)
		if not amxs then
			return
		end
		for i, amxfile in ipairs(amxs) do
			local amx = g_LoadedAMXs[amxfile:match('(.*)%.')]
			if amx then
				unloadAMX(amx, true)
			end
		end
	end
)

addEventHandler('onResourceStop', resourceRoot,
	function()
		local scoreboard = getResourceFromName('scoreboard')
		if getResourceState(scoreboard) == 'running' then
			exports.scoreboard:scoreboardForceTeamsHidden(false)
			exports.scoreboard:scoreboardRemoveColumn('Score')
		end
		table.each(g_LoadedAMXs, unloadAMX, false)
		amxUnloadAllPlugins()
		for i = 0, 49 do
			setGarageOpen(i, false)
		end
		setWeather(0)
	end
)

function getRunningGameMode()
	for name, amx in pairs(g_LoadedAMXs) do
		if amx.type == 'gamemode' then
			return amx
		end
	end
	return false
end

function getRunningFilterScripts()
	local result = {}
	for name, amx in pairs(g_LoadedAMXs) do
		if amx.type == 'filterscript' then
			result[#result + 1] = amx
		end
	end
	return result
end

function isWeaponSyncingNeeded(amx)
	if amx then
		if table.find(amx.natives, 'GetPlayerWeaponData') then
			return true
		end
		return false
	else
		for name, amx in pairs(g_LoadedAMXs) do
			if isWeaponSyncingNeeded(amx) then
				return true
			end
		end
		return false
	end
end

function readPrefixTable(hFile, offset, length, nameAsKey)
	-- build a name lookup table {name = offset} or {index = name}
	local entryOffset, entryNameOffset
	local result = {}
	for i = 0, length / 8 - 1 do
		entryOffset = readDWORDAt(hFile, offset)
		local entryName = readString(hFile, readDWORD(hFile))
		if nameAsKey then
			result[entryName] = entryOffset
		else
			result[i] = entryName
		end
		offset = offset + 8
	end
	return result
end

function procCallInternal(amx, nameOrOffset, ...)
	if type(amx) ~= 'table' then
		amx = g_LoadedAMXs[amx]
	end
	if not amx then
		outputDebugString('procCallInternal called with amx = nil, proc name = ' .. nameOrOffset, 2)
		return
	end

	local prevProc = amx.proc
	amx.proc = nameOrOffset
	local ret
	if type(nameOrOffset) == 'number' then
		if nameOrOffset == amx.main then
			 ret = amxCall(amx.cptr, -1, ...)
		end
	else
		if (g_EventNames[nameOrOffset]) then
			for k, v in pairs(g_Events) do
				if v == nameOrOffset then
					amxCall(amx.cptr, k, ...)
				end
			end
		end
		ret = amxCall(amx.cptr, nameOrOffset, ...)
	end
	amx.proc = prevProc
	return ret or 0
end

local g_CallbackStopValue = {
	OnPlayerText = false,
	OnPlayerRequestClass = false,
	OnPlayerRequestSpawn = false,
	OnPlayerCommandText = true
}

function procCallOnAll(fnName, ...)
	local stopVal = g_CallbackStopValue[fnName]
	for name, amx in pairs(g_LoadedAMXs) do
		if amx.type == 'filterscript' then
			local ret = procCallInternal(amx, fnName, ...)
			if stopVal ~= nil and amx.publics[fnName] and (ret ~= 0) == stopVal then
				return stopVal
			end
		end
	end
	local gamemode = getRunningGameMode()
	if gamemode and gamemode.publics[fnName] and procCallInternal(gamemode, fnName, ...) == 0 then
		return false
	end
	return true
end
