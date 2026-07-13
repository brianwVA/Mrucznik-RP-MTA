local function configureWorld()
    setGameType("Mrucznik-RP " .. MRP.version)
    setMapName("San Andreas")
    setWeather(MRP.defaultWeather)
    setGameSpeed(1)
end

local function ensureBaseline()
    local baseline = getResourceFromName(MRP.baselineResource)
    if not baseline then
        outputDebugString("[MRP] Brak zasobu " .. MRP.baselineResource .. ". Uruchom mta/setup.ps1.", 1)
        return false
    end
    if getResourceState(baseline) == "loaded" then
        return startResource(baseline)
    end
    return getResourceState(baseline) == "running"
end

addEventHandler("onResourceStart", resourceRoot, function()
    configureWorld()
    if ensureBaseline() then
        outputDebugString("[MRP] Uruchomiono oryginalny gamemode Pawn jako bazę zgodności.")
    end
end)

addEventHandler("onPlayerJoin", root, function()
    setPlayerNametagShowing(source, true)
end)
