#include "StdInc.h"
#include "UTF8.h"
#include <cstdlib>
#include <filesystem>
#ifndef WIN32
#include <cerrno>
#include <iconv.h>
#endif

using namespace std;
namespace fs = std::filesystem;

extern map < AMX *, AMXPROPS > loadedAMXs;

int setenv_portable(const char* name, const char* value, int overwrite) {
#ifdef WIN32
	if (!overwrite) {
		const char* envvar = getenv_portable(name);
		if (envvar != NULL) {
			return 1; //It's not null, we succeeded, don't set it
		}
	} //Otherwise continue and set it anyway
	return _putenv_s(name, value);
#else
	return setenv(name, value, overwrite);
#endif
}

//Credit: https://stackoverflow.com/questions/4130180/how-to-use-vs-c-getenvironmentvariable-as-cleanly-as-possible
const char* getenv_portable(const char* name)
{
#ifdef WIN32
	const DWORD buffSize = 65535;
	static char buffer[buffSize];
	if (GetEnvironmentVariableA(name, buffer, buffSize))
	{
		return buffer;
	}
	else
	{
		return 0;
	}
#else
	return getenv(name);
#endif
}

#ifndef WIN32
	void *getProcAddr ( HMODULE hModule, const char *szProcName )
	{
		char *szError = NULL;
		dlerror ();
		void *pFunc = dlsym ( hModule, szProcName );
		if ( ( szError = dlerror () ) != NULL )
			return NULL;
		return pFunc;
	}
#endif

#ifndef WIN32
static std::string ConvertEncoding(const char* input, const char* targetEncoding, const char* sourceEncoding)
{
	if (!input || !*input)
		return input ? std::string() : std::string();

	iconv_t converter = iconv_open(targetEncoding, sourceEncoding);
	if (converter == reinterpret_cast<iconv_t>(-1))
		return std::string(input);

	size_t inputLeft = strlen(input);
	std::string output(inputLeft * 4 + 4, '\0');
	char* inputCursor = const_cast<char*>(input);
	char* outputCursor = output.data();
	size_t outputLeft = output.size();

	while (iconv(converter, &inputCursor, &inputLeft, &outputCursor, &outputLeft) == static_cast<size_t>(-1)) {
		if (errno != E2BIG) {
			iconv_close(converter);
			return std::string(input);
		}

		const size_t written = static_cast<size_t>(outputCursor - output.data());
		output.resize(output.size() * 2);
		outputCursor = output.data() + written;
		outputLeft = output.size() - written;
	}

	iconv_close(converter);
	output.resize(static_cast<size_t>(outputCursor - output.data()));
	return output;
}
#endif

std::string ToUTF8(const char * str)
{
#ifdef WIN32
	if (!str || !*str)
		return str ? std::string() : std::string();

	// Mrucznik's Pawn sources and database use Windows-1250.  Relying on
	// mbstowcs() made the result depend on the process locale and produced
	// mojibake (for example "Ä…") on MTA clients.
	int wideLen = MultiByteToWideChar(1250, 0, str, -1, NULL, 0);
	if (wideLen <= 0)
		return std::string(str);

	std::wstring wide(wideLen, L'\0');
	MultiByteToWideChar(1250, 0, str, -1, &wide[0], wideLen);

	int utf8Len = WideCharToMultiByte(CP_UTF8, 0, wide.c_str(), -1, NULL, 0, NULL, NULL);
	if (utf8Len <= 0)
		return std::string(str);

	std::string result(utf8Len, '\0');
	WideCharToMultiByte(CP_UTF8, 0, wide.c_str(), -1, &result[0], utf8Len, NULL, NULL);
	result.resize(utf8Len - 1);
	return result;
#else
	return ConvertEncoding(str, "UTF-8", "WINDOWS-1250");
#endif
}

std::string ToOriginalCP(const char * str)
{
#ifdef WIN32
	if (!str || !*str)
		return str ? std::string() : std::string();

	int wideLen = MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, str, -1, NULL, 0);
	if (wideLen <= 0)
		return std::string(str);

	std::wstring wide(wideLen, L'\0');
	MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, str, -1, &wide[0], wideLen);

	int cpLen = WideCharToMultiByte(1250, 0, wide.c_str(), -1, NULL, 0, NULL, NULL);
	if (cpLen <= 0)
		return std::string(str);

	std::string result(cpLen, '\0');
	WideCharToMultiByte(1250, 0, wide.c_str(), -1, &result[0], cpLen, NULL, NULL);
	result.resize(cpLen - 1);
	return result;
#else
	return ConvertEncoding(str, "WINDOWS-1250", "UTF-8");
#endif
}

void lua_pushamxstring(lua_State* luaVM, AMX* amx, cell *physaddr) {
	if(!physaddr) {
		lua_pushnil(luaVM);
		return;
	}

	int strLen;
	amx_StrLen(physaddr, &strLen);

	char *str = new char[strLen+1];
	amx_GetString(str, physaddr, 0, strLen+1);

	std::string newstr = ToUTF8(str);

	lua_pushlstring(luaVM, newstr.c_str(), newstr.length());
	delete[] str;
}



void lua_pushamxstring(lua_State *luaVM, AMX *amx, cell addr) {
	cell *physaddr;

	amx_GetAddr(amx, addr, &physaddr);
	lua_pushamxstring(luaVM, amx, physaddr);
}

void lua_pushremotevalue(lua_State *localVM, lua_State *remoteVM, int index, bool toplevel) {
	bool seenTableList = false;

	switch(lua_type(remoteVM, index)) {
		case LUA_TNIL: {
			lua_pushnil(localVM);
			break;
		}
		case LUA_TBOOLEAN: {
			lua_pushboolean(localVM, lua_toboolean(remoteVM, index));
			break;
		}
		case LUA_TNUMBER: {
			lua_pushnumber(localVM, lua_tonumber(remoteVM, index));
			break;
		}
		case LUA_TSTRING: {
			size_t len;
			const char *str = lua_tolstring(remoteVM, index, &len);
			std::string newstr = ToUTF8(str);
			lua_pushlstring(localVM, newstr.c_str(), newstr.length());
			break;
		}
		case LUA_TTABLE: {
			if(toplevel && !seenTableList) {
				lua_newtable(localVM);
				lua_setfield(localVM, LUA_REGISTRYINDEX, "_dstSeenTables");
				lua_newtable(remoteVM);
				lua_setfield(remoteVM, LUA_REGISTRYINDEX, "_srcSeenTables");
				seenTableList = true;
			}

			if(index < 0)
				index = lua_gettop(remoteVM) + index + 1;

			lua_getfield(remoteVM, LUA_REGISTRYINDEX, "_srcSeenTables");

			lua_pushvalue(remoteVM, index);
			lua_gettable(remoteVM, -2);
			if(!lua_isnil(remoteVM, -1)) {
				lua_Number tblNum = lua_tonumber(remoteVM, -1);
				lua_pop(remoteVM, 2);
				lua_getfield(localVM, LUA_REGISTRYINDEX, "_dstSeenTables");
				lua_pushnumber(localVM, tblNum);
				lua_gettable(localVM, -2);
				lua_remove(localVM, -2);
				break;
			}
			lua_pop(remoteVM, 1);

			lua_newtable(localVM);
			lua_getfield(localVM, LUA_REGISTRYINDEX, "_dstSeenTables");
			lua_Number tblNum = lua_objlen(localVM, -1) + 1;
			lua_pushnumber(localVM, tblNum);
			lua_pushvalue(localVM, -3);
			lua_settable(localVM, -3);
			lua_pop(localVM, 1);

			lua_pushvalue(remoteVM, index);
			lua_pushnumber(remoteVM, tblNum);
			lua_settable(remoteVM, -3);
			lua_pop(remoteVM, 1);

			lua_pushnil(remoteVM);
			while(lua_next(remoteVM, index)) {
				lua_pushremotevalue(localVM, remoteVM, -2, false);
				lua_pushremotevalue(localVM, remoteVM, -1, false);
				lua_settable(localVM, -3);
				lua_pop(remoteVM, 1);
			}
			break;
		}
		case LUA_TUSERDATA:
		case LUA_TLIGHTUSERDATA: {
			lua_pushlightuserdata(localVM, lua_touserdata(remoteVM, index));
			break;
		}
		default: {
			lua_pushboolean(localVM, 0);
			break;
		}
	}
	if(toplevel && seenTableList) {
		lua_pushnil(localVM);
		lua_setfield(localVM, LUA_REGISTRYINDEX, "_dstSeenTables");
		lua_pushnil(remoteVM);
		lua_setfield(remoteVM, LUA_REGISTRYINDEX, "_srcSeenTables");
	}
}

void lua_pushremotevalues(lua_State *localVM, lua_State *remoteVM, int num) {
	for(int i = -num; i < 0; i++) {
		lua_pushremotevalue(localVM, remoteVM, i);
	}
}

vector<AMX *> getResourceAMXs(lua_State *luaVM) {
	vector<AMX *> amxs;
	for (const auto& it : loadedAMXs) {
		if (it.second.resourceVM == luaVM)
			amxs.push_back(it.first);
	}
	return amxs;
}

string getScriptFilePath(AMX *amx, const char *filename) {
	if(!isSafePath(filename) || loadedAMXs.find(amx) == loadedAMXs.end())
		return string();

	// First check if it exists in the resource folder
	fs::path respath = loadedAMXs[amx].filePath;
	respath = respath.remove_filename() / filename;
	if(exists(respath))
		return respath.string();

	// Then check if it exists in the main scriptfiles folder
	fs::path scriptfilespath = fs::path("mods/deathmatch/resources/amx/scriptfiles") / filename;
	if(exists(scriptfilespath))
	{
		return scriptfilespath.string();
	}

	// Otherwise default to amx's resource folder - make sure the folder
	// where the file is expected exists
	fs::path folder = respath;
	folder.remove_filename();
	create_directories(folder);
	return respath.string();
}

extern "C" char* getScriptFilePath(AMX *amx, char *dest, const char *filename, size_t destsize) {
	if(!isSafePath(filename))
		return 0;

	string path = getScriptFilePath(amx, filename);
	if(!path.empty() && path.size() < destsize) {
		strcpy(dest, path.c_str());
		return dest;
	} else {
		return 0;
	}
}

bool isSafePath(const char *path) {
	return path && !strstr(path, "..") && !strchr(path, ':') && !strchr(path, '|') && path[0] != '\\' && path[0] != '/';
}
