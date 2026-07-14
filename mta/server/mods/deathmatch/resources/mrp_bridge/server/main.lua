local function configureWorld()
    setGameType("Mrucznik-RP " .. MRP.version)
    setMapName("San Andreas")
    setGameSpeed(1)
end

local function ensureBaseline(restartRunning)
    local amx = getResourceFromName("amx")
    if not amx or getResourceState(amx) ~= "running" then
        outputDebugString("[MRP] Oczekiwanie na uruchomienie warstwy AMX.")
        return false
    end
    local baseline = getResourceFromName(MRP.baselineResource)
    if not baseline then
        outputDebugString("[MRP] Brak zasobu " .. MRP.baselineResource .. ". Uruchom mta/setup.ps1.", 1)
        return false
    end
    local state = getResourceState(baseline)
    if state == "running" then
        if restartRunning then
            return restartResource(baseline)
        end
        return true
    end
    if state == "loaded" then
        return startResource(baseline)
    end
    outputDebugString("[MRP] Nie można uruchomić " .. MRP.baselineResource .. "; stan: " .. state, 1)
    return false
end

addEventHandler("onResourceStart", resourceRoot, function()
    configureWorld()
    if ensureBaseline() then
        outputDebugString("[MRP] Uruchomiono oryginalny gamemode Pawn jako bazę zgodności.")
    end
end)

addEventHandler("onResourceStart", root, function(startedResource)
    if getResourceName(startedResource) ~= "amx" then return end
    setTimer(function()
        -- The map resource may already have been marked as running while the
        -- AMX gamemode was still changing. Restart it so amx.lua observes a
        -- fresh onResourceStart event and loads Mrucznik-RP.amx.
        if ensureBaseline(true) then
            outputDebugString("[MRP] Warstwa AMX gotowa; uruchomiono gamemode Pawn.")
        end
    end, 250, 1)
end)
