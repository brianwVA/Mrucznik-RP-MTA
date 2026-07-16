#include "../include/lua.hpp"

#include <cstdarg>

extern "C" {

int luaL_error(lua_State* state, const char* format, ...)
{
	va_list arguments;
	va_start(arguments, format);
	lua_pushvfstring(state, format, arguments);
	va_end(arguments);
	return lua_error(state);
}

const char* luaL_checklstring(lua_State* state, int argument, size_t* length)
{
	const char* value = lua_tolstring(state, argument, length);
	if (!value)
		luaL_error(state, "bad argument #%d (string expected, got %s)", argument,
			lua_typename(state, lua_type(state, argument)));
	return value;
}

lua_Number luaL_checknumber(lua_State* state, int argument)
{
	if (!lua_isnumber(state, argument))
		luaL_error(state, "bad argument #%d (number expected, got %s)", argument,
			lua_typename(state, lua_type(state, argument)));
	return lua_tonumber(state, argument);
}

void luaL_checktype(lua_State* state, int argument, int expectedType)
{
	const int actualType = lua_type(state, argument);
	if (actualType != expectedType)
		luaL_error(state, "bad argument #%d (%s expected, got %s)", argument,
			lua_typename(state, expectedType), lua_typename(state, actualType));
}

}
