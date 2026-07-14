local function configureWorld()
    setGameType("Mrucznik-RP " .. MRP.version)
    setMapName("San Andreas")
    setGameSpeed(1)
end

local function ensureBaseline()
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

addEventHandler("onResourceStart", root, function(startedResource)
    if getResourceName(startedResource) ~= "amx" then return end
    setTimer(function()
        if ensureBaseline() then
            outputDebugString("[MRP] Warstwa AMX gotowa; uruchomiono gamemode Pawn.")
        end
    end, 250, 1)
end)
