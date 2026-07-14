addEventHandler("onClientResourceStart", resourceRoot, function()
    setBlurLevel(0)
    -- Use MTA's native top chat/command line. The AMX resource already routes
    -- onPlayerChat and onConsole to the original Pawn callbacks.
    toggleControl("chatbox", true)
end)
