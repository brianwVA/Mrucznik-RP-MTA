local input
local inputVisible = false
local history = {}
local historyPosition = 1

local function closeInput()
    if not inputVisible then return end
    inputVisible = false
    guiSetVisible(input, false)
    guiSetText(input, "")
    guiSetInputEnabled(false)
end

local function openInput()
    if inputVisible or isCursorShowing() or isMTAWindowActive() then return end
    inputVisible = true
    historyPosition = #history + 1
    guiSetText(input, "")
    guiSetVisible(input, true)
    guiBringToFront(input)
    guiFocus(input)
    guiSetInputEnabled(true)
end

local function submitInput()
    if not inputVisible then return end
    local text = guiGetText(input):gsub("[%z\1-\31]", ""):sub(1, 255)
    closeInput()
    if text == "" then return end

    history[#history + 1] = text
    if #history > 50 then table.remove(history, 1) end

    if text:sub(1, 1) == "/" then
        triggerServerEvent("mrp:rawInput", resourceRoot, "command", text:sub(2))
    else
        triggerServerEvent("mrp:rawInput", resourceRoot, "chat", text)
    end
end

local function showHistory(position)
    if #history == 0 then return end
    historyPosition = math.max(1, math.min(#history + 1, position))
    local text = history[historyPosition] or ""
    guiSetText(input, text)
    guiEditSetCaretIndex(input, #text)
end

addEventHandler("onClientResourceStart", resourceRoot, function()
    setBlurLevel(0)

    local width, height = guiGetScreenSize()
    input = guiCreateEdit(20, height - 52, math.min(width - 40, 720), 30, "", false)
    guiEditSetMaxLength(input, 255)
    guiSetAlpha(input, 0.92)
    guiSetVisible(input, false)
    guiSetInputMode("no_binds_when_editing")

    -- SA-MP uses T and F6 for the chat/command line. Disable MTA's own input
    -- parser so hardcoded commands such as /help and /login cannot shadow the
    -- exact Mrucznik handlers.
    toggleControl("chatbox", false)
    bindKey("t", "down", openInput)
    bindKey("F6", "down", openInput)
    addEventHandler("onClientGUIAccepted", input, submitInput, false)
end)

addEventHandler("onClientKey", root, function(key, pressed)
    if not inputVisible or not pressed then return end
    if key == "escape" then
        cancelEvent()
        closeInput()
    elseif key == "arrow_u" then
        cancelEvent()
        showHistory(historyPosition - 1)
    elseif key == "arrow_d" then
        cancelEvent()
        showHistory(historyPosition + 1)
    end
end)

addEventHandler("onClientResourceStop", resourceRoot, function()
    toggleControl("chatbox", true)
    guiSetInputEnabled(false)
end)
