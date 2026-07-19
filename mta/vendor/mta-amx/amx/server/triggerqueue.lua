_triggerClientEvent = triggerClientEvent

local playerData = {}			-- { player = { loaded = bool, pending = {...} } }
local beginClientQueue

local function joinHandler(player)
	player = player or source
	playerData[player] = { loaded = false, pending = {}, queueStarted = false }
	-- Never flush before the client explicitly confirms that onClientCall is
	-- registered. MTA buffers remote events while downloading resources; an
	-- elapsed-time fallback can therefore release thousands of calls into a
	-- client that has not started its Lua scripts yet.
	setTimer(function()
		if playerData and playerData[player] and not playerData[player].queueStarted then
			outputDebugString(string.format(
				'[MTA AMX] Still waiting for client scripts: %s (%d queued events)',
				isElement(player) and getPlayerName(player) or 'disconnected',
				#(playerData[player].pending or {})
			), 2)
		end
	end, 120000, 1)
end

addEventHandler('onResourceStart', resourceRoot,
	function()
		for i, player in ipairs(getElementsByType('player')) do
			joinHandler(player)
		end
	end,
	false
)

addEventHandler('onResourceStop', resourceRoot,
	function()
		playerData = nil
	end,
	false
)

addEventHandler('onPlayerJoin', root, joinHandler)

beginClientQueue = function(player, reason)
		local data = playerData[player]
		if not data or data.queueStarted then return end
		data.queueStarted = true
		local pending = data.pending or {}
		data.loaded = true
		data.pending = nil

		outputDebugString(string.format(
			'[MTA AMX] Client startup queue for %s (%s): %d events',
			getPlayerName(player), tostring(reason), #pending
		), 3)

		-- Login dialogs are generated near the end of the Pawn join path. Move
		-- them ahead of bulk textdraw initialization so the player can authenticate
		-- immediately after the client becomes ready.
		local priority, normal = {}, {}
		for _, event in ipairs(pending) do
			if event.name == 'onClientCall' and event.args[1] == 'ShowPlayerDialog' then
				priority[#priority + 1] = event
			else
				normal[#normal + 1] = event
			end
		end
		pending = priority
		for _, event in ipairs(normal) do
			pending[#pending + 1] = event
		end

		-- Replay one call per frame. The original implementation sent the entire
		-- queue in one loop and could freeze MTA for many minutes.
		local head = 1
		local function flushNext()
			if not playerData or not playerData[player] or not isElement(player) then
				return
			end
			local event = pending[head]
			if not event then return end
			head = head + 1
			_triggerClientEvent(player, event.name, event.source, unpack(event.args))
			setTimer(flushNext, 16, 1)
		end
		setTimer(flushNext, 50, 1)
	end

addEvent('onLoadedAtClient', true)
addEventHandler('onLoadedAtClient', resourceRoot,
	function()
		beginClientQueue(client, 'client-ready')
	end,
	false
)

addEventHandler('onPlayerQuit', root,
	function()
		playerData[source] = nil
	end
)

local function addToQueue(player, name, source, args)
	if not playerData[player] or not playerData[player].pending then
		return
	end

	for i, a in pairs(args) do
		if type(a) == 'table' then
			args[i] = table.deepcopy(a)
		end
	end
	table.insert(playerData[player].pending, { name = name, source = source, args = args })
end

function triggerClientEvent(...)
	if not playerData then
		return
	end

	local args = { ... }
	local triggerFor, name, source
	if type(args[1]) == 'userdata' then
		triggerFor = table.remove(args, 1)
	else
		triggerFor = root
	end
	name = table.remove(args, 1)
	source = table.remove(args, 1)

	if triggerFor == root then
		-- trigger for everyone
		local triggerNow = true
		for player, data in pairs(playerData) do
			if not data.loaded then
				triggerNow = false
				break
			end
		end
		if triggerNow then
			_triggerClientEvent(root, name, source, unpack(args))
		else
			for player, data in pairs(playerData) do
				if data.loaded then
					_triggerClientEvent(player, name, source, unpack(args))
				else
					addToQueue(player, name, source, args)
				end
			end
		end
	elseif playerData[triggerFor] then
		-- trigger for single player
		if playerData[triggerFor].loaded then
			_triggerClientEvent(triggerFor, name, source, unpack(args))
		else
			addToQueue(triggerFor, name, source, args)
		end
	end
end
