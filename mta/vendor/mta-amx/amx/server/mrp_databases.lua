-- Exact Pawn-facing database contracts used by Mrucznik-RP.amx.
-- The original network DLLs predate modern MTA, so their synchronous APIs are
-- retained here on top of MTA's maintained MySQL and SQLite drivers.

local mysqlState = {
    connection = false,
    writeConnection = false,
    config = false,
    rows = {},
    resultColumns = {},
    tableColumns = {},
    rowIndex = 0,
    insertId = 0,
    pendingWrites = 0,
    debug = false,
}

local function trim(value)
    return (tostring(value or ""):gsub("^%s+", ""):gsub("%s+$", ""))
end

local function normalizeColumn(value)
    return tostring(value or ""):gsub("[`%s]", ""):lower()
end

local function splitSelectList(value)
    local result, start, depth, quote = {}, 1, 0, false
    local index = 1
    while index <= #value do
        local char = value:sub(index, index)
        if quote then
            if char == quote then
                if value:sub(index + 1, index + 1) == quote then
                    index = index + 1
                else
                    quote = false
                end
            elseif char == "\\" then
                index = index + 1
            end
        elseif char == "'" or char == '"' or char == "`" then
            quote = char
        elseif char == "(" then
            depth = depth + 1
        elseif char == ")" then
            depth = math.max(0, depth - 1)
        elseif char == "," and depth == 0 then
            result[#result + 1] = trim(value:sub(start, index - 1))
            start = index + 1
        end
        index = index + 1
    end
    result[#result + 1] = trim(value:sub(start))
    return result
end

local function isMysqlWrite(query)
    local command = trim(query):match("^([%a]+)")
    command = command and command:upper() or ""
    return command == "INSERT" or command == "UPDATE"
        or command == "DELETE" or command == "REPLACE"
end

local function pollMysql(query, connection)
    connection = connection or mysqlState.connection
    if not connection then
        return false, 2006, "No MySQL connection"
    end
    local handle = dbQuery(connection, query)
    if not handle then
        return false, 2006, "dbQuery rejected the connection"
    end
    return dbPoll(handle, -1)
end

local function queueMysqlWrite(query)
    local connection = mysqlState.writeConnection
    if not connection or not isElement(connection) then
        return false
    end

    mysqlState.pendingWrites = mysqlState.pendingWrites + 1
    local handle = dbQuery(function(queryHandle)
        local rows, errorCode, errorMessage = dbPoll(queryHandle, 0)
        mysqlState.pendingWrites = math.max(0, mysqlState.pendingWrites - 1)
        if rows == false then
            outputDebugString("[MRP MySQL R5 async] " .. tostring(errorCode) .. ": "
                .. tostring(errorMessage) .. " | " .. query, 1)
        elseif mysqlState.debug then
            outputDebugString("[MRP MySQL R5 async] " .. query)
        end
    end, connection, query)
    if not handle then
        mysqlState.pendingWrites = math.max(0, mysqlState.pendingWrites - 1)
        return false
    end
    return true
end

local function getTableColumns(tableName)
    if mysqlState.tableColumns[tableName] then
        return mysqlState.tableColumns[tableName]
    end
    local rows = pollMysql("SHOW COLUMNS FROM `" .. tableName:gsub("`", "``") .. "`")
    local columns = {}
    if type(rows) == "table" then
        for _, row in ipairs(rows) do
            if row.Field then columns[#columns + 1] = tostring(row.Field) end
        end
    end
    mysqlState.tableColumns[tableName] = columns
    return columns
end

local function findDriverColumn(row, candidates, used)
    for key in pairs(row or {}) do
        if not used[key] then
            local normalized = normalizeColumn(key)
            for _, candidate in ipairs(candidates) do
                if normalized == normalizeColumn(candidate) then
                    return key
                end
            end
        end
    end
    return candidates[1]
end

local function resolveResultColumns(query, rows)
    local upper = query:upper()
    local _, selectEnd = upper:find("%f[%a]SELECT%f[%A]")
    local fromStart, fromEnd
    if selectEnd then
        fromStart, fromEnd = upper:find("%sFROM%s", selectEnd + 1)
    end
    if not fromStart then return {} end

    local expressions = splitSelectList(query:sub(selectEnd + 1, fromStart - 1))
    local tableName = query:sub(fromEnd + 1):match("^%s*`?([%w_]+)`?")
    local row, used, columns = rows[1] or {}, {}, {}
    for _, expression in ipairs(expressions) do
        if expression == "*" or expression:match("^[`%w_]+%.%*$") then
            for _, column in ipairs(tableName and getTableColumns(tableName) or {}) do
                local actual = findDriverColumn(row, {column}, used)
                columns[#columns + 1], used[actual] = actual, true
            end
        else
            local alias = expression:match("[Aa][Ss]%s+`?([%w_]+)`?%s*$")
            local simple = expression:match("%.`?([%w_]+)`?%s*$")
                or expression:match("^`?([%w_]+)`?$")
            local candidates = {}
            if alias then candidates[#candidates + 1] = alias end
            candidates[#candidates + 1] = expression
            if simple then candidates[#candidates + 1] = simple end
            local actual = findDriverColumn(row, candidates, used)
            columns[#columns + 1], used[actual] = actual, true
        end
    end
    local extras = {}
    for key in pairs(row) do
        if not used[key] then extras[#extras + 1] = key end
    end
    table.sort(extras, function(a, b) return tostring(a):lower() < tostring(b):lower() end)
    for _, key in ipairs(extras) do columns[#columns + 1] = key end
    return columns
end

local function connectMysql()
    local config = mysqlState.config
    if not config then return false end
    if mysqlState.connection and isElement(mysqlState.connection) then
        destroyElement(mysqlState.connection)
    end
    if mysqlState.writeConnection and isElement(mysqlState.writeConnection) then
        destroyElement(mysqlState.writeConnection)
    end
    mysqlState.connection = dbConnect(
        "mysql",
        "dbname=" .. config.database .. ";host=" .. config.host .. ";charset=cp1250",
        config.user,
        config.password,
        "share=0;batch=0;autoreconnect=1;queue=mrucznik-r5-reads;tag=mrucznik-r5"
    )
    if not mysqlState.connection then return false end

    -- Writes use one ordered queue.  Periodic account saves can enqueue work
    -- without blocking the game thread, while critical writes still poll this
    -- same queue and therefore cannot be overtaken by an older autosave.
    mysqlState.writeConnection = dbConnect(
        "mysql",
        "dbname=" .. config.database .. ";host=" .. config.host .. ";charset=cp1250",
        config.user,
        config.password,
        "share=0;batch=0;autoreconnect=1;queue=mrucznik-r5-writes;tag=mrucznik-r5-writes"
    )
    if not mysqlState.writeConnection then
        destroyElement(mysqlState.connection)
        mysqlState.connection = false
        return false
    end
    mysqlState.pendingWrites = 0
    return true
end

function mysql_connect(amx, host, user, database, password)
    mysqlState.config = {host=host, user=user, database=database, password=password}
    return connectMysql() and 1 or 0
end

function mysql_ping(amx, connectionHandle)
    return mysqlState.connection and isElement(mysqlState.connection)
        and mysqlState.writeConnection and isElement(mysqlState.writeConnection) and 1 or 0
end

function mysql_reconnect(amx, connectionHandle)
    return connectMysql() and 1 or 0
end

function mysql_debug(amx, enabled)
    mysqlState.debug = enabled ~= 0
    return 1
end

function mysql_query(amx, query, resultId, extraId, connectionHandle)
    local writeQuery = isMysqlWrite(query)
    -- The periodic Pawn autosave runs inside this named public callback.
    -- Scope async writes to that callback instead of keeping a mutable global
    -- switch which could leak after a Pawn runtime error.
    local asyncWriteCallback = type(amx) == "table"
        and (amx.proc == "SaveMyAccountTimer" or amx.proc == "ServerStuffSave")
    if asyncWriteCallback and writeQuery then
        mysqlState.rows, mysqlState.resultColumns, mysqlState.rowIndex = {}, {}, 0
        if not queueMysqlWrite(query) then
            outputDebugString("[MRP MySQL R5 async] Failed to queue query | " .. query, 1)
            return 0
        end
        return 1
    end

    local connection = writeQuery and mysqlState.writeConnection or mysqlState.connection
    local rows, affectedOrError, insertOrMessage = pollMysql(query, connection)
    if rows == false then
        outputDebugString("[MRP MySQL R5] " .. tostring(affectedOrError) .. ": "
            .. tostring(insertOrMessage) .. " | " .. query, 1)
        mysqlState.rows, mysqlState.resultColumns, mysqlState.rowIndex = {}, {}, 0
        return 0
    end
    mysqlState.rows = rows or {}
    mysqlState.resultColumns = resolveResultColumns(query, mysqlState.rows)
    mysqlState.rowIndex = 0
    mysqlState.insertId = tonumber(insertOrMessage) or 0
    if mysqlState.debug then outputDebugString("[MRP MySQL R5] " .. query) end
    return 1
end

function mysql_store_result(amx, connectionHandle)
    return #mysqlState.rows > 0 and 1 or 0
end

function mysql_free_result(amx, connectionHandle)
    mysqlState.rows, mysqlState.resultColumns, mysqlState.rowIndex = {}, {}, 0
    return 1
end

function mysql_num_rows(amx, connectionHandle)
    return #mysqlState.rows
end

local function currentRow()
    return mysqlState.rows[mysqlState.rowIndex > 0 and mysqlState.rowIndex or 1]
end

local function rowValue(row, column)
    if not row or not column then return "" end
    if row[column] ~= nil then return row[column] end
    local wanted = normalizeColumn(column)
    for key, value in pairs(row) do
        if normalizeColumn(key) == wanted then return value end
    end
    return ""
end

function mysql_fetch_row_format(amx, output, delimiter, connectionHandle)
    local index = mysqlState.rowIndex + 1
    local row = mysqlState.rows[index]
    if not row then return 0 end
    mysqlState.rowIndex = index
    local values = {}
    for _, column in ipairs(mysqlState.resultColumns) do
        values[#values + 1] = tostring(rowValue(row, column) or "")
    end
    writeMemString(amx, output, table.concat(values, delimiter))
    return 1
end

function mysql_retrieve_row(amx, connectionHandle)
    local index = mysqlState.rowIndex + 1
    if not mysqlState.rows[index] then return 0 end
    mysqlState.rowIndex = index
    return 1
end

function mysql_fetch_field_row(amx, output, fieldName, connectionHandle)
    local value = rowValue(currentRow(), fieldName)
    writeMemString(amx, output, tostring(value or ""))
    return 1
end

function mysql_fetch_int(amx, connectionHandle)
    return tonumber(rowValue(currentRow(), mysqlState.resultColumns[1])) or 0
end

function mysql_insert_id(amx, connectionHandle)
    return mysqlState.insertId
end

function mysql_real_escape_string(amx, source, output, connectionHandle)
    local escaped = mysqlState.connection and dbPrepareString(mysqlState.connection, "?", source)
    if escaped and escaped:sub(1, 1) == "'" and escaped:sub(-1) == "'" then
        escaped = escaped:sub(2, -2)
    end
    escaped = escaped or source:gsub("\\", "\\\\"):gsub("'", "\\'")
    writeMemString(amx, output, escaped)
    return 1
end

-- pawn-redis subset imported by the compiled AMX. SET clears an existing TTL;
-- INCRBY preserves it, exactly like Redis.
local redisState = {connection=false, clientId=0}

local function redisNow()
    return getRealTime().timestamp
end

local function redisEnsure()
    if redisState.connection then return true end
    redisState.connection = dbConnect(
        "sqlite", "mrp_redis.db", "", "", "share=0;batch=0;tag=mrucznik-redis"
    )
    if not redisState.connection then return false end
    dbExec(redisState.connection,
        "CREATE TABLE IF NOT EXISTS kv (`key` TEXT PRIMARY KEY, `value` TEXT NOT NULL, `expires` INTEGER)")
    dbExec(redisState.connection, "DELETE FROM kv WHERE expires IS NOT NULL AND expires<=?", redisNow())
    dbExec(redisState.connection,
        "INSERT OR IGNORE INTO kv (`key`,`value`,`expires`) VALUES ('server:mrucznik-redis','1',NULL)")
    return true
end

local function redisGet(key)
    if not redisEnsure() then return false end
    local handle = dbQuery(redisState.connection,
        "SELECT value,expires FROM kv WHERE `key`=? AND (expires IS NULL OR expires>?)", key, redisNow())
    local rows = dbPoll(handle, -1)
    if type(rows) ~= "table" or not rows[1] then
        dbExec(redisState.connection, "DELETE FROM kv WHERE `key`=?", key)
        return false
    end
    return tostring(rows[1].value), rows[1].expires
end

local function redisSet(key, value, expires)
    if not redisEnsure() then return false end
    if expires then
        return dbExec(redisState.connection,
            "INSERT OR REPLACE INTO kv (`key`,`value`,`expires`) VALUES (?,?,?)", key, tostring(value), expires)
    end
    return dbExec(redisState.connection,
        "INSERT OR REPLACE INTO kv (`key`,`value`,`expires`) VALUES (?,?,NULL)", key, tostring(value))
end

function Redis_Connect(amx, host, port, password, outputClient)
    if not redisEnsure() then return 1 end
    amx.memDAT[outputClient] = redisState.clientId
    return 0
end

function Redis_Exists(amx, clientId, key)
    return redisGet(key) ~= false and 1 or 0
end

function Redis_GetInt(amx, clientId, key, output)
    local value = redisGet(key)
    if value == false then return 3 end
    amx.memDAT[output] = tonumber(value) or 0
    return 0
end


function Redis_SetInt(amx, clientId, key, value)
    return redisSet(key, value) and 0 or 1
end

function Redis_GetString(amx, clientId, key, output, length)
    local value = redisGet(key)
    if value == false then return 2 end
    writeMemString(amx, output, value:sub(1, math.max(0, length - 1)))
    return 0
end


function Redis_SetString(amx, clientId, key, value)
    return redisSet(key, value) and 0 or 1
end

function Redis_Command(amx, clientId, command)
    if not redisEnsure() then return 1 end
    local operation, key, argument = command:match("^(%S+)%s+(%S+)%s*(.-)%s*$")
    operation = operation and operation:upper() or ""
    if operation == "DEL" then
        return dbExec(redisState.connection, "DELETE FROM kv WHERE `key`=?", key) and 0 or 1
    elseif operation == "EXPIRE" and tonumber(argument) then
        return dbExec(redisState.connection, "UPDATE kv SET expires=? WHERE `key`=?",
            redisNow() + tonumber(argument), key) and 0 or 1
    elseif operation == "INCRBY" then
        local current, expires = redisGet(key)
        return redisSet(key, (tonumber(current) or 0) + (tonumber(argument) or 0), expires) and 0 or 1
    end
    outputDebugString("[MRP key-value] Unsupported Redis command: " .. tostring(command), 1)
    return 1
end

g_SAMPSyscallPrototypes.mysql_connect = {'s', 's', 's', 's'}
g_SAMPSyscallPrototypes.mysql_debug = {'i'}
g_SAMPSyscallPrototypes.mysql_fetch_field_row = {'r', 's', 'i'}
g_SAMPSyscallPrototypes.mysql_fetch_int = {'i'}
g_SAMPSyscallPrototypes.mysql_fetch_row_format = {'r', 's', 'i'}
g_SAMPSyscallPrototypes.mysql_free_result = {'i'}
g_SAMPSyscallPrototypes.mysql_insert_id = {'i'}
g_SAMPSyscallPrototypes.mysql_num_rows = {'i'}
g_SAMPSyscallPrototypes.mysql_ping = {'i'}
g_SAMPSyscallPrototypes.mysql_query = {'s', 'i', 'i', 'i'}
g_SAMPSyscallPrototypes.mysql_real_escape_string = {'s', 'r', 'i'}
g_SAMPSyscallPrototypes.mysql_reconnect = {'i'}
g_SAMPSyscallPrototypes.mysql_retrieve_row = {'i'}
g_SAMPSyscallPrototypes.mysql_store_result = {'i'}
g_SAMPSyscallPrototypes.Redis_Command = {'i', 's'}
g_SAMPSyscallPrototypes.Redis_Connect = {'s', 'i', 's', 'r'}
g_SAMPSyscallPrototypes.Redis_Exists = {'i', 's'}
g_SAMPSyscallPrototypes.Redis_GetInt = {'i', 's', 'r'}
g_SAMPSyscallPrototypes.Redis_GetString = {'i', 's', 'r', 'i'}
g_SAMPSyscallPrototypes.Redis_SetInt = {'i', 's', 'i'}
g_SAMPSyscallPrototypes.Redis_SetString = {'i', 's', 's'}
