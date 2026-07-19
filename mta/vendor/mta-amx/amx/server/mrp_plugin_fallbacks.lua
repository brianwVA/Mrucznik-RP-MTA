-- Portable fallbacks for optional legacy SA-MP plugins that have no reliable
-- Linux x64 build.  Gameplay-critical sscanf, streamer, RegEx, Whirlpool and
-- ColAndreas remain native plugins; these implementations cover diagnostics,
-- logs, Discord notifications, premium HTTP helpers and Pawn-managed memory.

local fallbackMemory = {}
local nextFallbackMemory = 1
local fallbackLogs = {}
local nextFallbackLog = 1
local fallbackDiscordChannels = {}

local function cellCount(value)
    return math.max(0, math.floor(tonumber(value) or 0))
end

local function getMemory(pointer)
    return fallbackMemory[tonumber(pointer) or 0]
end

function PrintBacktrace(amx)
    outputDebugString("[MRP crashdetect] Pawn requested a backtrace (portable x64 fallback).", 2)
    return 1
end

function MEM_new(amx, cells)
    local size = math.max(1, cellCount(cells))
    local pointer = nextFallbackMemory
    nextFallbackMemory = nextFallbackMemory + 1
    fallbackMemory[pointer] = {size=size, cells={}}
    for index = 0, size - 1 do fallbackMemory[pointer].cells[index] = 0 end
    return pointer
end

function MEM_new_val(amx, value)
    local pointer = MEM_new(amx, 1)
    fallbackMemory[pointer].cells[0] = tonumber(value) or 0
    return pointer
end

function MEM_new_arr(amx, source, size)
    local pointer = MEM_new(amx, size)
    local memory = fallbackMemory[pointer]
    for index = 0, memory.size - 1 do
        memory.cells[index] = amx.memDAT[source + index * 4] or 0
    end
    return pointer
end

function MEM_clone(amx, pointer)
    local source = getMemory(pointer)
    if not source then return 0 end
    local clone = MEM_new(amx, source.size)
    for index = 0, source.size - 1 do fallbackMemory[clone].cells[index] = source.cells[index] or 0 end
    return clone
end

function MEM_delete(amx, pointer)
    fallbackMemory[tonumber(pointer) or 0] = nil
    return 0
end

function MEM_get_size(amx, pointer)
    local memory = getMemory(pointer)
    return memory and memory.size or 0
end

function MEM_get_val(amx, pointer, index)
    local memory = getMemory(pointer)
    index = cellCount(index)
    return memory and memory.cells[index] or 0
end

function MEM_set_val(amx, pointer, index, value)
    local memory = getMemory(pointer)
    index = cellCount(index)
    if not memory or index >= memory.size then return 0 end
    memory.cells[index] = tonumber(value) or 0
    return pointer
end

function MEM_get_arr(amx, pointer, index, destination, size)
    local memory = getMemory(pointer)
    index, size = cellCount(index), cellCount(size)
    if not memory then return 0 end
    for offset = 0, math.min(size, memory.size - index) - 1 do
        amx.memDAT[destination + offset * 4] = memory.cells[index + offset] or 0
    end
    return destination
end

function MEM_set_arr(amx, pointer, index, source, size)
    local memory = getMemory(pointer)
    index, size = cellCount(index), cellCount(size)
    if not memory then return 0 end
    for offset = 0, math.min(size, memory.size - index) - 1 do
        memory.cells[index + offset] = amx.memDAT[source + offset * 4] or 0
    end
    return pointer
end

function MEM_copy(amx, destination, source, size, destinationIndex, sourceIndex)
    local sourceMemory, destinationMemory = getMemory(source), getMemory(destination)
    if not sourceMemory or not destinationMemory then return 0 end
    size, destinationIndex, sourceIndex = cellCount(size), cellCount(destinationIndex), cellCount(sourceIndex)
    local temporary = {}
    for offset = 0, size - 1 do temporary[offset] = sourceMemory.cells[sourceIndex + offset] or 0 end
    for offset = 0, math.min(size, destinationMemory.size - destinationIndex) - 1 do
        destinationMemory.cells[destinationIndex + offset] = temporary[offset]
    end
    return destination
end

function MEM_UM_get_addr(amx, address)
    return tonumber(address) or 0
end

function MEM_UM_zero(amx, address, size, index)
    size, index = cellCount(size), cellCount(index)
    for offset = 0, size - 1 do amx.memDAT[address + (index + offset) * 4] = 0 end
    return address
end

function CreateLog(amx, name, debugInfo)
    local id = nextFallbackLog
    nextFallbackLog = nextFallbackLog + 1
    name = tostring(name or "mrucznik"):gsub("[^%w_/%-]", "_")
    fallbackLogs[id] = name
    return id
end

function DestroyLog(amx, logger)
    fallbackLogs[tonumber(logger) or 0] = nil
    return 1
end

function Log(amx, logger, level, message)
    local name = fallbackLogs[tonumber(logger) or 0] or "mrucznik"
    outputDebugString(string.format("[MRP log:%s:%s] %s", name, tostring(level), tostring(message or "")))
    return 1
end


function Profiler_GetState(amx) return 0 end
function Profiler_Start(amx) return 1 end
function Profiler_Stop(amx) return 1 end
function Profiler_Dump(amx) return 1 end

function DCC_FindChannelById(amx, channelId)
    channelId = tostring(channelId or "")
    if not fallbackDiscordChannels[channelId] then
        fallbackDiscordChannels[channelId] = #fallbackDiscordChannels + 1
    end
    return fallbackDiscordChannels[channelId]
end

function DCC_SendChannelMessage(amx, channel, message)
    outputDebugString("[MRP Discord fallback] " .. tostring(message or ""))
    return 1
end

function RequestsClient(amx, endpoint, headers) return 1 end
function RequestHeaders(amx) return 1 end
function JsonObject(amx) return 1 end
function JsonCleanup(amx, node, automatic) return 1 end
function JsonGetInt(amx, node, key, output)
    amx.memDAT[output] = 0
    return 0
end
function JsonGetString(amx, node, key, output, size)
    writeMemString(amx, output, "")
    return 0
end
function RequestJSON(amx, client, path, method, callback, node, headers)
    outputDebugString("[MRP requests fallback] Pominięto żądanie do " .. tostring(path or ""), 2)
    return 0
end

g_SAMPSyscallPrototypes.PrintBacktrace = {}
g_SAMPSyscallPrototypes.MEM_clone = {'i'}
g_SAMPSyscallPrototypes.MEM_copy = {'i', 'i', 'i', 'i', 'i'}
g_SAMPSyscallPrototypes.MEM_delete = {'i'}
g_SAMPSyscallPrototypes.MEM_get_arr = {'i', 'i', 'i', 'i'}
g_SAMPSyscallPrototypes.MEM_get_size = {'i'}
g_SAMPSyscallPrototypes.MEM_get_val = {'i', 'i'}
g_SAMPSyscallPrototypes.MEM_new = {'i'}
g_SAMPSyscallPrototypes.MEM_new_arr = {'i', 'i'}
g_SAMPSyscallPrototypes.MEM_new_val = {'i'}
g_SAMPSyscallPrototypes.MEM_set_arr = {'i', 'i', 'i', 'i'}
g_SAMPSyscallPrototypes.MEM_set_val = {'i', 'i', 'i'}
g_SAMPSyscallPrototypes.MEM_UM_get_addr = {'i'}
g_SAMPSyscallPrototypes.MEM_UM_zero = {'i', 'i', 'i'}
g_SAMPSyscallPrototypes.CreateLog = {'s', 'b'}
g_SAMPSyscallPrototypes.DestroyLog = {'i'}
g_SAMPSyscallPrototypes.Log = {'i', 'i', 's'}
g_SAMPSyscallPrototypes.Profiler_GetState = {}
g_SAMPSyscallPrototypes.Profiler_Start = {}
g_SAMPSyscallPrototypes.Profiler_Stop = {}
g_SAMPSyscallPrototypes.Profiler_Dump = {}
g_SAMPSyscallPrototypes.DCC_FindChannelById = {'s'}
g_SAMPSyscallPrototypes.DCC_SendChannelMessage = {'i', 's'}
g_SAMPSyscallPrototypes.RequestsClient = {'s', 'i'}
g_SAMPSyscallPrototypes.RequestHeaders = {}
g_SAMPSyscallPrototypes.JsonObject = {}
g_SAMPSyscallPrototypes.JsonCleanup = {'i', 'b'}
g_SAMPSyscallPrototypes.JsonGetInt = {'i', 's', 'i'}
g_SAMPSyscallPrototypes.JsonGetString = {'i', 's', 'i', 'i'}
g_SAMPSyscallPrototypes.RequestJSON = {'i', 's', 'i', 's', 'i', 'i'}
