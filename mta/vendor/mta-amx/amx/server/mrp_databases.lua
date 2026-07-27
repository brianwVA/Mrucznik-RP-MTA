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
    if not connectMysql() then return 0 end

    -- Keep the account-side house pointer consistent with the one-time INI
    -- migration in mrp_compat.lua. The backup table makes the operation
    -- reversible even if an older database snapshot still contains owners.
    local marker = "scriptfiles/Domy/.owners-reset-database-20260726-v1.done"
    if not fileExists(marker) then
        local backupRows = pollMysql(
            "CREATE TABLE IF NOT EXISTS `mrp_backup_house_owners_20260726` "
            .. "AS SELECT `UID`, `Nick`, `Dom` FROM `mru_konta` WHERE `Dom` <> 0",
            mysqlState.writeConnection
        )
        local resetRows = backupRows ~= false and pollMysql(
            "UPDATE `mru_konta` SET `Dom` = 0 WHERE `Dom` <> 0",
            mysqlState.writeConnection
        )
        if backupRows ~= false and resetRows ~= false then
            local done = fileCreate(marker)
            if done then
                fileWrite(done, "reset=20260726-v1\n")
                fileClose(done)
            end
            outputDebugString("[MRP houses] Wyzerowano przypisania domow w MySQL.")
        else
            outputDebugString("[MRP houses] Reset przypisan MySQL nie powiodl sie.", 1)
        end
    end
    return 1
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
        outputDebugString("[MRP MySQL R5][" .. tostring(amx and amx.name or "unknown") .. "] "
            .. tostring(affectedOrError) .. ": "
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

-- BlueG MySQL R41 compatibility used by KotnikRP.  The hosting platform runs
-- an older 32-bit Linux userland on which recent mysql.so builds are not
-- reliably loadable.  These adapters keep the original Pawn API while using
-- MTA's maintained database driver.
local r41State = {
    nextCache = 0,
    caches = {},
    activeCache = false,
    nextOrm = 0,
    orms = {},
    lastError = 0,
    lastErrorText = "",
}

local function r41ReadFile(path)
    if not fileExists(path) then return false end
    local handle = fileOpen(path, true)
    if not handle then return false end
    local content = fileRead(handle, fileGetSize(handle))
    fileClose(handle)
    return content
end

local function r41Escape(value)
    value = tostring(value or "")
    if mysqlState.connection and isElement(mysqlState.connection) then
        local prepared = dbPrepareString(mysqlState.connection, "?", value)
        if prepared and prepared:sub(1, 1) == "'" and prepared:sub(-1) == "'" then
            return prepared:sub(2, -2)
        end
    end
    return value:gsub("\\", "\\\\")
        :gsub("\0", "\\0")
        :gsub("\n", "\\n")
        :gsub("\r", "\\r")
        :gsub("\26", "\\Z")
        :gsub("'", "\\'")
        :gsub('"', '\\"')
end

local function r41NewCache(query, rows, affectedRows, insertId)
    r41State.nextCache = r41State.nextCache + 1
    local id = r41State.nextCache
    rows = type(rows) == "table" and rows or {}
    r41State.caches[id] = {
        query = query,
        rows = rows,
        columns = resolveResultColumns(query, rows),
        affectedRows = tonumber(affectedRows) or 0,
        insertId = tonumber(insertId) or 0,
    }
    r41State.activeCache = id
    return id
end

local function r41Cache()
    return r41State.caches[r41State.activeCache]
end

local function r41RunQuery(query)
    local write = isMysqlWrite(query)
    local connection = write and mysqlState.writeConnection or mysqlState.connection
    local rows, affectedOrError, insertOrMessage = pollMysql(query, connection)
    if rows == false then
        r41State.lastError = tonumber(affectedOrError) or 1
        r41State.lastErrorText = tostring(insertOrMessage or "Database query failed")
        return false
    end
    r41State.lastError, r41State.lastErrorText = 0, ""
    return r41NewCache(query, rows, affectedOrError, insertOrMessage)
end

local function r41CallbackArgs(amx, formatString, rawArgs)
    local values = {}
    local rawIndex = 0
    for index = 1, #tostring(formatString or "") do
        local kind = formatString:sub(index, index)
        if kind ~= " " then
            rawIndex = rawIndex + 1
            local address = rawArgs[rawIndex]
            if kind == "s" then
                values[#values + 1] = readMemString(amx, address) or ""
            elseif kind == "f" then
                values[#values + 1] = amx.memDAT[address] or 0
            else
                values[#values + 1] = amx.memDAT[address] or 0
            end
        end
    end
    return values
end

local function r41Format(amx, pattern, rawArgs)
    local argumentIndex = 0
    local function nextValue(kind)
        argumentIndex = argumentIndex + 1
        local address = rawArgs[argumentIndex]
        if not address then return kind == "string" and "" or 0 end
        if kind == "string" or kind == "escape" then
            return readMemString(amx, address) or ""
        elseif kind == "float" then
            return cell2float(amx.memDAT[address] or 0)
        end
        return amx.memDAT[address] or 0
    end

    return tostring(pattern or ""):gsub("%%(%-?)(%d*)(%.?%d*)([%a%%])",
        function(flag, width, precision, conversion)
            if conversion == "%" then return "%" end
            local kind
            if conversion == "s" then
                kind = "string"
            elseif conversion == "e" then
                kind = "escape"
            elseif conversion == "f" then
                kind = "float"
            elseif conversion == "d" or conversion == "i"
                or conversion == "u" or conversion == "x"
            then
                kind = "int"
            else
                return "%" .. flag .. width .. precision .. conversion
            end

            local value = nextValue(kind)
            if kind == "escape" then return r41Escape(value) end
            if conversion == "i" or conversion == "u" then conversion = "d" end
            local specifier = "%" .. flag .. width .. precision .. conversion
            local ok, formatted = pcall(string.format, specifier, value)
            return ok and formatted or tostring(value)
        end)
end

function mysql_connect_file(amx, fileName)
    fileName = tostring(fileName or "mysql.ini")
    local content = r41ReadFile(fileName)
        or r41ReadFile("scriptfiles/" .. fileName:gsub("^.*/", ""))
    if not content then
        r41State.lastError, r41State.lastErrorText = 2, "mysql.ini not found"
        return 0
    end

    local config = {}
    for line in content:gmatch("[^\r\n]+") do
        local key, value = line:match("^%s*([%w_]+)%s*=%s*(.-)%s*$")
        if key and value and not key:match("^[#;]") then
            config[key:lower()] = value:gsub('^"(.*)"$', "%1"):gsub("^'(.*)'$", "%1")
        end
    end
    mysqlState.config = {
        host = config.hostname or config.host or config.server or "127.0.0.1",
        user = config.username or config.user or "root",
        password = config.password or "",
        database = config.database or config.dbname or "",
    }
    if mysqlState.config.database == "" or not connectMysql() then
        r41State.lastError, r41State.lastErrorText = 2006, "MySQL connection failed"
        return 0
    end
    r41State.lastError, r41State.lastErrorText = 0, ""
    return 1
end

function mysql_close(amx, handle)
    if mysqlState.connection and isElement(mysqlState.connection) then
        destroyElement(mysqlState.connection)
    end
    if mysqlState.writeConnection and isElement(mysqlState.writeConnection) then
        destroyElement(mysqlState.writeConnection)
    end
    mysqlState.connection, mysqlState.writeConnection = false, false
    return 1
end

function mysql_errno(amx, handle)
    return r41State.lastError
end

function mysql_error(amx, output, length, handle)
    writeMemString(amx, output, r41State.lastErrorText:sub(1, math.max(0, length - 1)))
    return 1
end

function mysql_escape_string(amx, source, output, length, handle)
    writeMemString(amx, output, r41Escape(source):sub(1, math.max(0, length - 1)))
    return 1
end

function mysql_format(amx, handle, output, length, pattern, ...)
    local result = r41Format(amx, pattern, {...})
    writeMemString(amx, output, result:sub(1, math.max(0, length - 1)))
    return 1
end

function mysql_set_charset(amx, charset, handle)
    if not mysqlState.connection then return 0 end
    local safeCharset = tostring(charset or ""):match("^([%w_]+)$")
    if not safeCharset then return 0 end
    local cache = r41RunQuery("SET NAMES " .. safeCharset)
    if cache then
        r41State.caches[cache] = nil
        r41State.activeCache = false
        return 1
    end
    return 0
end

function mysql_query(amx, handle, query, useCache)
    return r41RunQuery(query) or 0
end

function mysql_tquery(amx, handle, query, callback, formatString, ...)
    local previousCache = r41State.activeCache
    local cache = r41RunQuery(query)
    if not cache then
        if amx.publics and amx.publics.OnQueryError then
            procCallInternal(amx, "OnQueryError", r41State.lastError,
                r41State.lastErrorText, callback or "", query, handle or 1)
        end
        r41State.activeCache = previousCache
        return 0
    end

    if callback and callback ~= "" then
        local callbackArgs = r41CallbackArgs(amx, formatString, {...})
        procCallInternal(amx, callback, unpack(callbackArgs))
    end
    r41State.caches[cache] = nil
    r41State.activeCache = previousCache
    return 1
end

function cache_get_row_count(amx, output)
    local cache = r41Cache()
    amx.memDAT[output] = cache and #cache.rows or 0
    return 1
end

local function r41Column(cache, index)
    return cache and cache.columns[(tonumber(index) or 0) + 1]
end

local function r41Value(rowIndex, column)
    local cache = r41Cache()
    local row = cache and cache.rows[(tonumber(rowIndex) or 0) + 1]
    return rowValue(row, column)
end

function cache_get_value_index(amx, rowIndex, columnIndex, output, length)
    local cache = r41Cache()
    local value = r41Value(rowIndex, r41Column(cache, columnIndex))
    writeMemString(amx, output, tostring(value or ""):sub(1, math.max(0, length - 1)))
    return 1
end

function cache_get_value_index_int(amx, rowIndex, columnIndex, output)
    local cache = r41Cache()
    amx.memDAT[output] = tonumber(r41Value(rowIndex, r41Column(cache, columnIndex))) or 0
    return 1
end

function cache_get_value_index_float(amx, rowIndex, columnIndex, output)
    local cache = r41Cache()
    amx.memDAT[output] = float2cell(tonumber(r41Value(rowIndex, r41Column(cache, columnIndex))) or 0)
    return 1
end

function cache_get_value_name(amx, rowIndex, column, output, length)
    writeMemString(amx, output,
        tostring(r41Value(rowIndex, column) or ""):sub(1, math.max(0, length - 1)))
    return 1
end

function cache_get_value_name_int(amx, rowIndex, column, output)
    amx.memDAT[output] = tonumber(r41Value(rowIndex, column)) or 0
    return 1
end

function cache_get_value_name_float(amx, rowIndex, column, output)
    amx.memDAT[output] = float2cell(tonumber(r41Value(rowIndex, column)) or 0)
    return 1
end

function cache_delete(amx, cacheId)
    r41State.caches[cacheId] = nil
    if r41State.activeCache == cacheId then r41State.activeCache = false end
    return 1
end

function cache_set_active(amx, cacheId)
    if not r41State.caches[cacheId] then return 0 end
    r41State.activeCache = cacheId
    return 1
end

function cache_is_valid(amx, cacheId)
    return r41State.caches[cacheId] and 1 or 0
end

function cache_affected_rows(amx)
    local cache = r41Cache()
    return cache and cache.affectedRows or 0
end

function cache_insert_id(amx)
    local cache = r41Cache()
    return cache and cache.insertId or 0
end

local function r41Identifier(value)
    return tostring(value or ""):match("^([%w_]+)$")
end

local function r41OrmValue(amx, variable)
    if variable.kind == "string" then
        return "'" .. r41Escape(readMemString(amx, variable.address) or "") .. "'"
    elseif variable.kind == "float" then
        return tostring(cell2float(amx.memDAT[variable.address] or 0))
    end
    return tostring(tonumber(amx.memDAT[variable.address]) or 0)
end

function orm_create(amx, tableName, handle)
    tableName = r41Identifier(tableName)
    if not tableName then return 0 end
    r41State.nextOrm = r41State.nextOrm + 1
    r41State.orms[r41State.nextOrm] = {
        amx = amx,
        tableName = tableName,
        variables = {},
        key = false,
        error = 1,
    }
    return r41State.nextOrm
end

function orm_destroy(amx, ormId)
    r41State.orms[ormId] = nil
    return 1
end

function orm_addvar_int(amx, ormId, address, column)
    local orm, safeColumn = r41State.orms[ormId], r41Identifier(column)
    if not orm or not safeColumn then return 0 end
    orm.variables[safeColumn] = {kind="int", address=address, column=safeColumn}
    return 1
end

function orm_addvar_float(amx, ormId, address, column)
    local orm, safeColumn = r41State.orms[ormId], r41Identifier(column)
    if not orm or not safeColumn then return 0 end
    orm.variables[safeColumn] = {kind="float", address=address, column=safeColumn}
    return 1
end

function orm_addvar_string(amx, ormId, address, length, column)
    local orm, safeColumn = r41State.orms[ormId], r41Identifier(column)
    if not orm or not safeColumn then return 0 end
    orm.variables[safeColumn] = {
        kind="string", address=address, length=tonumber(length) or 1, column=safeColumn
    }
    return 1
end

function orm_setkey(amx, ormId, column)
    local orm, safeColumn = r41State.orms[ormId], r41Identifier(column)
    if not orm or not safeColumn or not orm.variables[safeColumn] then return 0 end
    orm.key = safeColumn
    return 1
end

local function r41OrmCallback(amx, callback, formatString, rawArgs)
    if callback and callback ~= "" then
        procCallInternal(amx, callback,
            unpack(r41CallbackArgs(amx, formatString, rawArgs)))
    end
end

function orm_load(amx, ormId, callback, formatString, ...)
    local orm = r41State.orms[ormId]
    if not orm or not orm.key then return 0 end
    local keyVariable = orm.variables[orm.key]
    local query = ("SELECT * FROM `%s` WHERE `%s`=%s LIMIT 1"):format(
        orm.tableName, orm.key, r41OrmValue(amx, keyVariable))
    local cacheId = r41RunQuery(query)
    local cache = cacheId and r41State.caches[cacheId]
    local row = cache and cache.rows[1]
    if not row then
        orm.error = 2
    else
        orm.error = 1
        for column, variable in pairs(orm.variables) do
            local value = rowValue(row, column)
            if variable.kind == "string" then
                writeMemString(amx, variable.address,
                    tostring(value or ""):sub(1, math.max(0, variable.length - 1)))
            elseif variable.kind == "float" then
                amx.memDAT[variable.address] = float2cell(tonumber(value) or 0)
            else
                amx.memDAT[variable.address] = tonumber(value) or 0
            end
        end
    end
    if cacheId then r41State.caches[cacheId] = nil end
    r41State.activeCache = false
    r41OrmCallback(amx, callback, formatString, {...})
    return orm.error
end

orm_select = orm_load

local function r41OrmSave(amx, ormId, callback, formatString, rawArgs)
    local orm = r41State.orms[ormId]
    if not orm or not orm.key then return 0 end
    local assignments = {}
    for column, variable in pairs(orm.variables) do
        if column ~= orm.key then
            assignments[#assignments + 1] = ("`%s`=%s"):format(
                column, r41OrmValue(amx, variable))
        end
    end
    table.sort(assignments)
    local query = ("UPDATE `%s` SET %s WHERE `%s`=%s"):format(
        orm.tableName, table.concat(assignments, ","),
        orm.key, r41OrmValue(amx, orm.variables[orm.key]))
    local cacheId = r41RunQuery(query)
    orm.error = cacheId and 1 or 0
    if cacheId then r41State.caches[cacheId] = nil end
    r41State.activeCache = false
    r41OrmCallback(amx, callback, formatString, rawArgs)
    return orm.error
end

function orm_update(amx, ormId, callback, formatString, ...)
    return r41OrmSave(amx, ormId, callback, formatString, {...})
end

function orm_save(amx, ormId, callback, formatString, ...)
    return r41OrmSave(amx, ormId, callback, formatString, {...})
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

-- Exact BlueG R41 native set imported by Kotnik-RP-MTA.amx.
g_SAMPSyscallPrototypes.mysql_connect_file = {'s'}
g_SAMPSyscallPrototypes.mysql_close = {'i'}
g_SAMPSyscallPrototypes.mysql_errno = {'i'}
g_SAMPSyscallPrototypes.mysql_error = {'r', 'i', 'i'}
g_SAMPSyscallPrototypes.mysql_escape_string = {'s', 'r', 'i', 'i'}
g_SAMPSyscallPrototypes.mysql_format = {'i', 'r', 'i', 's'}
g_SAMPSyscallPrototypes.mysql_query = {'i', 's', 'b'}
g_SAMPSyscallPrototypes.mysql_set_charset = {'s', 'i'}
g_SAMPSyscallPrototypes.mysql_tquery = {'i', 's', 's', 's'}
g_SAMPSyscallPrototypes.cache_get_row_count = {'r'}
g_SAMPSyscallPrototypes.cache_get_value_index = {'i', 'i', 'r', 'i'}
g_SAMPSyscallPrototypes.cache_get_value_index_float = {'i', 'i', 'r'}
g_SAMPSyscallPrototypes.cache_get_value_index_int = {'i', 'i', 'r'}
g_SAMPSyscallPrototypes.cache_get_value_name = {'i', 's', 'r', 'i'}
g_SAMPSyscallPrototypes.cache_get_value_name_float = {'i', 's', 'r'}
g_SAMPSyscallPrototypes.cache_get_value_name_int = {'i', 's', 'r'}
g_SAMPSyscallPrototypes.cache_delete = {'i'}
g_SAMPSyscallPrototypes.cache_set_active = {'i'}
g_SAMPSyscallPrototypes.cache_affected_rows = {}
g_SAMPSyscallPrototypes.cache_insert_id = {}
g_SAMPSyscallPrototypes.orm_create = {'s', 'i'}
g_SAMPSyscallPrototypes.orm_destroy = {'i'}
g_SAMPSyscallPrototypes.orm_addvar_int = {'i', 'r', 's'}
g_SAMPSyscallPrototypes.orm_addvar_float = {'i', 'r', 's'}
g_SAMPSyscallPrototypes.orm_addvar_string = {'i', 'r', 'i', 's'}
g_SAMPSyscallPrototypes.orm_setkey = {'i', 's'}
g_SAMPSyscallPrototypes.orm_select = {'i', 's', 's'}
g_SAMPSyscallPrototypes.orm_update = {'i', 's', 's'}
g_SAMPSyscallPrototypes.orm_save = {'i', 's', 's'}
