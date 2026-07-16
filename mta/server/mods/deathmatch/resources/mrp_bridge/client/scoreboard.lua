local scoreboardVisible = false
local scoreboardPlayers = {}
local scoreboardScroll = 0
local scoreboardVisibleRows = 1
local scoreboardLastRefresh = 0
local tabActionForwarded = false
local tabActionReleasePending = false
local tabActionReleaseTimer = nil
local releaseForwardedTabAction

local REFRESH_INTERVAL = 250
local SCROLL_STEP = 3

local COLORS = {
    border = tocolor(165, 165, 165, 225),
    panel = tocolor(8, 8, 8, 215),
    title = tocolor(24, 39, 58, 245),
    columns = tocolor(32, 32, 32, 245),
    row = tocolor(15, 15, 15, 210),
    rowAlternate = tocolor(25, 25, 25, 210),
    localPlayer = tocolor(45, 68, 94, 225),
    separator = tocolor(115, 115, 115, 150),
    text = tocolor(238, 238, 238, 255),
    mutedText = tocolor(190, 190, 190, 255),
    shadow = tocolor(0, 0, 0, 225),
    scrollTrack = tocolor(45, 45, 45, 230),
    scrollThumb = tocolor(175, 175, 175, 240)
}

local function clamp(value, minimum, maximum)
    return math.max(minimum, math.min(maximum, value))
end

local function textInputIsActive()
    return isChatBoxInputActive()
        or isConsoleActive()
        or isMainMenuActive()
        or isMTAWindowActive()
end

local function cleanPlayerName(name)
    return tostring(name or ""):gsub("#%x%x%x%x%x%x", "")
end

local function playerID(player)
    local id = tonumber(getElementData(player, "amx.id"))
        or tonumber(getElementData(player, "ID"))
    return id and math.floor(id) or 65535
end

local function refreshPlayers(force)
    local now = getTickCount()
    if not force and now - scoreboardLastRefresh < REFRESH_INTERVAL then return end

    scoreboardLastRefresh = now
    scoreboardPlayers = {}
    for _, player in ipairs(getElementsByType("player")) do
        if isElement(player) then
            scoreboardPlayers[#scoreboardPlayers + 1] = player
        end
    end

    table.sort(scoreboardPlayers, function(left, right)
        local leftID, rightID = playerID(left), playerID(right)
        if leftID == rightID then
            return cleanPlayerName(getPlayerName(left)):lower()
                < cleanPlayerName(getPlayerName(right)):lower()
        end
        return leftID < rightID
    end)

    scoreboardScroll = clamp(
        scoreboardScroll,
        0,
        math.max(0, #scoreboardPlayers - scoreboardVisibleRows)
    )
end

local function getLayout()
    local screenWidth, screenHeight = guiGetScreenSize()
    local scale = clamp(math.min(screenWidth / 1920, screenHeight / 1080), 0.85, 1.25)
    local width = math.min(math.floor(780 * scale), screenWidth - math.floor(40 * scale))
    local titleHeight = math.floor(38 * scale)
    local columnsHeight = math.floor(27 * scale)
    local rowHeight = math.floor(25 * scale)
    local footerHeight = math.floor(24 * scale)
    local maximumContentHeight = math.floor(screenHeight * 0.68)
    local maximumRows = math.max(4, math.floor(maximumContentHeight / rowHeight))
    local visibleRows = clamp(#scoreboardPlayers, 1, maximumRows)
    local contentHeight = visibleRows * rowHeight
    local height = titleHeight + columnsHeight + contentHeight + footerHeight

    return {
        screenWidth = screenWidth,
        screenHeight = screenHeight,
        scale = scale,
        x = math.floor((screenWidth - width) / 2),
        y = math.floor((screenHeight - height) / 2),
        width = width,
        height = height,
        titleHeight = titleHeight,
        columnsHeight = columnsHeight,
        rowHeight = rowHeight,
        footerHeight = footerHeight,
        visibleRows = visibleRows,
        contentHeight = contentHeight
    }
end

local function drawText(text, left, top, right, bottom, color, scale, font, alignX, alignY, clip)
    dxDrawText(
        text,
        left + 1,
        top + 1,
        right + 1,
        bottom + 1,
        COLORS.shadow,
        scale,
        font,
        alignX,
        alignY,
        clip,
        false,
        true
    )
    dxDrawText(
        text,
        left,
        top,
        right,
        bottom,
        color,
        scale,
        font,
        alignX,
        alignY,
        clip,
        false,
        true
    )
end

local function scoreboardVersion()
    local version = MRP and MRP.version or "2.9"
    return tostring(version):gsub("%-mta$", "")
end

local function renderScoreboard()
    if not scoreboardVisible then return end
    if textInputIsActive() then
        scoreboardVisible = false
        releaseForwardedTabAction(true)
        return
    end

    refreshPlayers(false)
    local layout = getLayout()
    scoreboardVisibleRows = layout.visibleRows
    scoreboardScroll = clamp(
        scoreboardScroll,
        0,
        math.max(0, #scoreboardPlayers - scoreboardVisibleRows)
    )

    local x, y, width = layout.x, layout.y, layout.width
    local titleBottom = y + layout.titleHeight
    local columnsBottom = titleBottom + layout.columnsHeight
    local contentBottom = columnsBottom + layout.contentHeight
    local right = x + width
    local padding = math.floor(12 * layout.scale)
    local scrollbarWidth = math.max(4, math.floor(5 * layout.scale))
    local contentRight = right - padding - scrollbarWidth - math.floor(6 * layout.scale)

    local idRight = x + math.floor(75 * layout.scale)
    local pingLeft = contentRight - math.floor(90 * layout.scale)
    local scoreLeft = pingLeft - math.floor(110 * layout.scale)
    local nameLeft = idRight + math.floor(8 * layout.scale)

    dxDrawRectangle(x - 1, y - 1, width + 2, layout.height + 2, COLORS.border, true)
    dxDrawRectangle(x, y, width, layout.height, COLORS.panel, true)
    dxDrawRectangle(x, y, width, layout.titleHeight, COLORS.title, true)
    dxDrawRectangle(x, titleBottom, width, layout.columnsHeight, COLORS.columns, true)

    drawText(
        "M-RP V" .. scoreboardVersion(),
        x + padding,
        y,
        right - padding,
        titleBottom,
        COLORS.text,
        1.08 * layout.scale,
        "default-bold",
        "left",
        "center",
        true
    )
    drawText(
        "Gracze: " .. tostring(#scoreboardPlayers),
        x + padding,
        y,
        right - padding,
        titleBottom,
        COLORS.text,
        0.94 * layout.scale,
        "default-bold",
        "right",
        "center",
        true
    )

    drawText("ID", x + padding, titleBottom, idRight, columnsBottom, COLORS.text,
        0.9 * layout.scale, "default-bold", "center", "center", true)
    drawText("Gracz", nameLeft, titleBottom, scoreLeft, columnsBottom, COLORS.text,
        0.9 * layout.scale, "default-bold", "left", "center", true)
    drawText("Wynik", scoreLeft, titleBottom, pingLeft, columnsBottom, COLORS.text,
        0.9 * layout.scale, "default-bold", "center", "center", true)
    drawText("Ping", pingLeft, titleBottom, contentRight, columnsBottom, COLORS.text,
        0.9 * layout.scale, "default-bold", "center", "center", true)

    for visibleIndex = 1, layout.visibleRows do
        local playerIndex = scoreboardScroll + visibleIndex
        local player = scoreboardPlayers[playerIndex]
        local rowTop = columnsBottom + (visibleIndex - 1) * layout.rowHeight
        local rowBottom = rowTop + layout.rowHeight
        local rowColor = visibleIndex % 2 == 0 and COLORS.rowAlternate or COLORS.row
        if player == localPlayer then rowColor = COLORS.localPlayer end
        dxDrawRectangle(x, rowTop, width, layout.rowHeight, rowColor, true)

        if isElement(player) then
            local id = playerID(player)
            if id == 65535 then id = "-" end
            local score = tonumber(getElementData(player, "Score")) or 0
            local ping = getPlayerPing(player) or 0
            local red, green, blue = getPlayerNametagColor(player)
            local nameColor = tocolor(red or 255, green or 255, blue or 255, 255)

            drawText(tostring(id), x + padding, rowTop, idRight, rowBottom, COLORS.text,
                0.9 * layout.scale, "default", "center", "center", true)
            drawText(cleanPlayerName(getPlayerName(player)), nameLeft, rowTop, scoreLeft - padding,
                rowBottom, nameColor, 0.9 * layout.scale, "default-bold", "left", "center", true)
            drawText(tostring(math.floor(score)), scoreLeft, rowTop, pingLeft, rowBottom, COLORS.text,
                0.9 * layout.scale, "default", "center", "center", true)
            drawText(tostring(math.floor(ping)), pingLeft, rowTop, contentRight, rowBottom, COLORS.text,
                0.9 * layout.scale, "default", "center", "center", true)
        end
    end

    dxDrawLine(idRight, titleBottom, idRight, contentBottom, COLORS.separator, 1, true)
    dxDrawLine(scoreLeft, titleBottom, scoreLeft, contentBottom, COLORS.separator, 1, true)
    dxDrawLine(pingLeft, titleBottom, pingLeft, contentBottom, COLORS.separator, 1, true)

    if #scoreboardPlayers > layout.visibleRows then
        local trackX = right - padding - scrollbarWidth
        dxDrawRectangle(trackX, columnsBottom, scrollbarWidth, layout.contentHeight,
            COLORS.scrollTrack, true)
        local thumbHeight = math.max(
            math.floor(22 * layout.scale),
            math.floor(layout.contentHeight * layout.visibleRows / #scoreboardPlayers)
        )
        local maximumScroll = #scoreboardPlayers - layout.visibleRows
        local thumbTravel = layout.contentHeight - thumbHeight
        local thumbY = columnsBottom
        if maximumScroll > 0 then
            thumbY = thumbY + math.floor(thumbTravel * scoreboardScroll / maximumScroll)
        end
        dxDrawRectangle(trackX, thumbY, scrollbarWidth, thumbHeight, COLORS.scrollThumb, true)
    end

    local firstShown = #scoreboardPlayers == 0 and 0 or scoreboardScroll + 1
    local lastShown = math.min(#scoreboardPlayers, scoreboardScroll + layout.visibleRows)
    local footerText = string.format(
        "%d-%d z %d  |  przewijanie: kółko myszy / PgUp / PgDn",
        firstShown,
        lastShown,
        #scoreboardPlayers
    )
    drawText(footerText, x + padding, contentBottom, right - padding,
        contentBottom + layout.footerHeight, COLORS.mutedText, 0.78 * layout.scale,
        "default", "center", "center", true)
end

local function scrollScoreboard(amount)
    refreshPlayers(false)
    scoreboardScroll = clamp(
        scoreboardScroll + amount,
        0,
        math.max(0, #scoreboardPlayers - scoreboardVisibleRows)
    )
end

local function tabUsesActionControl()
    if not isControlEnabled("action") then return false end
    local actionKeys = getBoundKeys("action")
    return type(actionKeys) == "table" and actionKeys.tab ~= nil
end

local function anotherActionKeyIsHeld()
    local actionKeys = getBoundKeys("action")
    if type(actionKeys) ~= "table" then return false end
    for key in pairs(actionKeys) do
        if key ~= "tab" and getKeyState(key) then return true end
    end
    return false
end

releaseForwardedTabAction = function(deferred)
    if not tabActionForwarded and not tabActionReleasePending then return end
    tabActionForwarded = false
    tabActionReleasePending = true

    local function releaseIfNeeded()
        tabActionReleaseTimer = nil
        if tabActionForwarded then
            tabActionReleasePending = false
            return
        end
        -- A second physical key can be bound to the same control. Keep
        -- KEY_ACTION pressed until that control is actually released.
        if not anotherActionKeyIsHeld() then
            triggerServerEvent("mrp:tabAction", localPlayer, false)
        end
        tabActionReleasePending = false
    end

    if deferred then
        if isTimer(tabActionReleaseTimer) then killTimer(tabActionReleaseTimer) end
        tabActionReleaseTimer = setTimer(releaseIfNeeded, 50, 1)
    else
        if isTimer(tabActionReleaseTimer) then killTimer(tabActionReleaseTimer) end
        tabActionReleaseTimer = nil
        triggerServerEvent("mrp:tabAction", localPlayer, false)
        tabActionReleasePending = false
    end
end

addEventHandler("onClientKey", root, function(key, pressed)
    if key == "tab" then
        if pressed then
            if textInputIsActive() then
                scoreboardVisible = false
                return
            end
            -- Cancel MTA's built-in scoreboard bind before it can display its
            -- own table or execute the internal "Toggle scoreboard" command.
            -- TAB is also the default GTA "action" control, so forward that
            -- state explicitly to keep Pawn KEY_ACTION behavior unchanged.
            cancelEvent()
            if isTimer(tabActionReleaseTimer) then killTimer(tabActionReleaseTimer) end
            tabActionReleaseTimer = nil
            tabActionReleasePending = false
            tabActionForwarded = tabUsesActionControl()
            if tabActionForwarded then
                triggerServerEvent("mrp:tabAction", localPlayer, true)
            end
            scoreboardVisible = true
            refreshPlayers(true)
        else
            scoreboardVisible = false
            releaseForwardedTabAction(true)
        end
        return
    end

    if not scoreboardVisible or not pressed then return end

    if key == "mouse_wheel_up" or key == "arrow_u" then
        cancelEvent()
        scrollScoreboard(-SCROLL_STEP)
    elseif key == "mouse_wheel_down" or key == "arrow_d" then
        cancelEvent()
        scrollScoreboard(SCROLL_STEP)
    elseif key == "pgup" then
        cancelEvent()
        scrollScoreboard(-scoreboardVisibleRows)
    elseif key == "pgdn" then
        cancelEvent()
        scrollScoreboard(scoreboardVisibleRows)
    elseif key == "home" then
        cancelEvent()
        scoreboardScroll = 0
    elseif key == "end" then
        cancelEvent()
        scoreboardScroll = math.max(0, #scoreboardPlayers - scoreboardVisibleRows)
    end
end, true, "high+10")

addEventHandler("onClientRender", root, renderScoreboard)
addEventHandler("onClientPlayerJoin", root, function() refreshPlayers(true) end)
addEventHandler("onClientPlayerQuit", root, function() scoreboardLastRefresh = 0 end)
addEventHandler("onClientMinimize", root, function()
    scoreboardVisible = false
    releaseForwardedTabAction(false)
end)
addEventHandler("onClientResourceStop", resourceRoot, function()
    scoreboardVisible = false
    releaseForwardedTabAction(false)
end)
