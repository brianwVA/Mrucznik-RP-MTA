-- Native MTA equivalent of SA-MP's filterscripts/realtime.pwn.
--
-- The original realtime.amx was built as a gamemode and stalls the legacy AMX
-- runtime when loaded as a filterscript. Keeping this tiny feature native
-- preserves its visible behaviour without blocking the remaining gamemode.

local fineWeatherIDs = { 1, 2, 3, 4, 5, 6, 7, 12, 13, 14, 15, 17, 18, 24, 25, 26, 27, 28, 29, 30, 40 }
local foggyWeatherIDs = { 9, 19, 20, 31, 32 }
local wetWeatherIDs = { 8 }

local timeTextDrawID
local realtimeTimer
local lastWeatherUpdate = 0

local function setPlayerRealtime(player, hour, minute)
	if isElement(player) then
		clientCall(player, 'setTime', hour % 24, minute % 60)
	end
end

local function updateWorldWeather()
	local probability = math.random(0, 99)
	local weatherIDs

	if probability < 70 then
		weatherIDs = fineWeatherIDs
	elseif probability < 95 then
		weatherIDs = foggyWeatherIDs
	else
		weatherIDs = wetWeatherIDs
	end

	setWeather(weatherIDs[math.random(1, #weatherIDs)])
end

local function updateTimeAndWeather()
	local realtime = getRealTime()
	local hour, minute = realtime.hour, realtime.minute
	local textdraw = timeTextDrawID and g_TextDraws[timeTextDrawID]

	if textdraw then
		TextDrawSetString(nil, textdraw, string.format('%02d:%02d', hour, minute))
	end

	-- SetWorldTime in the AMX bridge sets the global hour with minute zero.
	setTime(hour, 0)
	for _, player in ipairs(getElementsByType('player')) do
		setPlayerRealtime(player, hour, minute)
	end

	if lastWeatherUpdate == 0 then
		updateWorldWeather()
	end
	lastWeatherUpdate = (lastWeatherUpdate + 1) % 60
end

local function createRealtimeTextDraw()
	timeTextDrawID = TextDrawCreate(nil, 605.0, 25.0, '00:00')
	local textdraw = g_TextDraws[timeTextDrawID]
	if not textdraw then
		outputDebugString('MRP realtime: unable to create the clock textdraw', 1)
		return false
	end

	TextDrawUseBox(nil, textdraw, false)
	TextDrawFont(nil, textdraw, 3)
	TextDrawSetShadow(nil, textdraw, 0)
	TextDrawSetOutline(nil, textdraw, 2)
	TextDrawBackgroundColor(nil, textdraw, 0, 0, 0, 255)
	TextDrawColor(nil, textdraw, 255, 255, 255, 255)
	TextDrawAlignment(nil, textdraw, 3)
	TextDrawLetterSize(nil, textdraw, 0.5, 1.5)
	return true
end

addEventHandler('onResourceStart', resourceRoot,
	function()
		if not createRealtimeTextDraw() then
			return
		end

		updateTimeAndWeather()
		realtimeTimer = setTimer(updateTimeAndWeather, 60 * 1000, 0)
		outputDebugString('MRP realtime: native time, weather and HUD clock initialized')
	end
)

addEventHandler('onResourceStop', resourceRoot,
	function()
		if isTimer(realtimeTimer) then
			killTimer(realtimeTimer)
		end
		if timeTextDrawID and g_TextDraws[timeTextDrawID] then
			TextDrawDestroy(nil, timeTextDrawID)
		end
	end
)

addEventHandler('onPlayerJoin', root,
	function()
		local realtime = getRealTime()
		setPlayerRealtime(source, realtime.hour, realtime.minute)
	end
)

addEventHandler('onPlayerSpawn', root,
	function()
		if timeTextDrawID then
			TextDrawShowForPlayer(nil, source, timeTextDrawID)
		end
		local realtime = getRealTime()
		setPlayerRealtime(source, realtime.hour, realtime.minute)
	end
)

addEventHandler('onPlayerWasted', root,
	function()
		if timeTextDrawID then
			TextDrawHideForPlayer(nil, source, timeTextDrawID)
		end
	end
)
