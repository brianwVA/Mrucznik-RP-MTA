#define _GNU_SOURCE
#include <dlfcn.h>
#include <stddef.h>

/*
 * MTA 1.6 links its Lua runtime statically into deathmatch.so and loads
 * external modules with a local symbol scope.  Linking a module to a second
 * Lua copy corrupts the foreign lua_State.  These tail-call trampolines look
 * up and invoke the exact Lua functions exported by the already loaded
 * deathmatch.so, without touching the argument stack.
 */

static const char* const g_names[] = {
    "luaL_checklstring", "luaL_checknumber", "luaL_checktype", "luaL_error",
    "lua_createtable", "lua_getfield", "lua_gettable", "lua_gettop",
    "lua_insert", "lua_isnumber", "lua_next", "lua_objlen", "lua_pcall",
    "lua_pushboolean", "lua_pushcclosure", "lua_pushlightuserdata",
    "lua_pushlstring", "lua_pushnil", "lua_pushnumber", "lua_pushstring",
    "lua_pushvalue", "lua_remove", "lua_setfield", "lua_setmetatable",
    "lua_settable", "lua_settop", "lua_toboolean", "lua_tolstring",
    "lua_tonumber", "lua_touserdata", "lua_type"
};

static void* g_functions[sizeof(g_names) / sizeof(g_names[0])];
static void* g_deathmatch;

__attribute__((visibility("hidden")))
void* mrp_resolve_mta_lua(unsigned int index)
{
    if (g_functions[index])
        return g_functions[index];

    if (!g_deathmatch) {
        g_deathmatch = dlopen("mods/deathmatch/deathmatch.so", RTLD_LAZY | RTLD_NOLOAD);
        if (!g_deathmatch)
            g_deathmatch = dlopen("deathmatch.so", RTLD_LAZY | RTLD_NOLOAD);
    }

    if (!g_deathmatch)
        return NULL;

    g_functions[index] = dlsym(g_deathmatch, g_names[index]);
    return g_functions[index];
}

#define MTA_LUA_TRAMPOLINE(name, index)                                      \
    __attribute__((naked, visibility("default"))) void name(void)           \
    {                                                                        \
        __asm__ volatile(                                                    \
            "pushl $" #index "\n\t"                                       \
            "calll mrp_resolve_mta_lua\n\t"                                \
            "addl $4, %esp\n\t"                                            \
            "jmp *%eax\n\t");                                              \
    }

MTA_LUA_TRAMPOLINE(luaL_checklstring, 0)
MTA_LUA_TRAMPOLINE(luaL_checknumber, 1)
MTA_LUA_TRAMPOLINE(luaL_checktype, 2)
MTA_LUA_TRAMPOLINE(luaL_error, 3)
MTA_LUA_TRAMPOLINE(lua_createtable, 4)
MTA_LUA_TRAMPOLINE(lua_getfield, 5)
MTA_LUA_TRAMPOLINE(lua_gettable, 6)
MTA_LUA_TRAMPOLINE(lua_gettop, 7)
MTA_LUA_TRAMPOLINE(lua_insert, 8)
MTA_LUA_TRAMPOLINE(lua_isnumber, 9)
MTA_LUA_TRAMPOLINE(lua_next, 10)
MTA_LUA_TRAMPOLINE(lua_objlen, 11)
MTA_LUA_TRAMPOLINE(lua_pcall, 12)
MTA_LUA_TRAMPOLINE(lua_pushboolean, 13)
MTA_LUA_TRAMPOLINE(lua_pushcclosure, 14)
MTA_LUA_TRAMPOLINE(lua_pushlightuserdata, 15)
MTA_LUA_TRAMPOLINE(lua_pushlstring, 16)
MTA_LUA_TRAMPOLINE(lua_pushnil, 17)
MTA_LUA_TRAMPOLINE(lua_pushnumber, 18)
MTA_LUA_TRAMPOLINE(lua_pushstring, 19)
MTA_LUA_TRAMPOLINE(lua_pushvalue, 20)
MTA_LUA_TRAMPOLINE(lua_remove, 21)
MTA_LUA_TRAMPOLINE(lua_setfield, 22)
MTA_LUA_TRAMPOLINE(lua_setmetatable, 23)
MTA_LUA_TRAMPOLINE(lua_settable, 24)
MTA_LUA_TRAMPOLINE(lua_settop, 25)
MTA_LUA_TRAMPOLINE(lua_toboolean, 26)
MTA_LUA_TRAMPOLINE(lua_tolstring, 27)
MTA_LUA_TRAMPOLINE(lua_tonumber, 28)
MTA_LUA_TRAMPOLINE(lua_touserdata, 29)
MTA_LUA_TRAMPOLINE(lua_type, 30)
