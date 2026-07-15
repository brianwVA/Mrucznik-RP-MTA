addEventHandler("onClientResourceStart", resourceRoot, function()
    setBlurLevel(0)
    -- Use MTA's native top chat/command line. The AMX resource already routes
    -- onPlayerChat and onConsole to the original Pawn callbacks.
    toggleControl("chatbox", true)
end)

-- MTA reserves Y for team chat, while SA-MP exposes the same physical key as
-- KEY_YES. Mrucznik uses KEY_YES to start and stop a vehicle engine. Cancel
-- only the hard-coded MTA bind and forward the key state to the AMX bridge.
local conversationYesForwarded = false

local function textInputIsActive()
    return isChatBoxInputActive()
        or isConsoleActive()
        or isMainMenuActive()
        or isMTAWindowActive()
end

addEventHandler("onClientKey", root, function(key, pressed)
    if key ~= "y" then return end

    if pressed then
        if textInputIsActive() then return end
        cancelEvent()
        conversationYesForwarded = true
        triggerServerEvent("mrp:conversationYes", localPlayer, true)
    elseif conversationYesForwarded then
        conversationYesForwarded = false
        triggerServerEvent("mrp:conversationYes", localPlayer, false)
    end
end)

-- MTA does not allow scripts to execute its hard-coded `quit` command for
-- security reasons. /q therefore performs the SA-MP-equivalent server quit;
-- the player is returned to the MTA menu and Pawn receives reason QUIT.
addCommandHandler("q", function()
    triggerServerEvent("mrp:requestQuit", localPlayer)
end, false)
