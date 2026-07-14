/*********************************************************
 *
 *  Multi Theft Auto: San Andreas - Deathmatch
 *
 *  ml_base, External lua add-on module
 *
 *  Copyright © 2003-2018 MTA.  All Rights Reserved.
 *
 *  Grand Theft Auto is © 2002-2018 Rockstar North
 *
 *  THE FOLLOWING SOURCES ARE PART OF THE MULTI THEFT
 *  AUTO SOFTWARE DEVELOPMENT KIT AND ARE RELEASED AS
 *  OPEN SOURCE FILES. THESE FILES MAY BE USED AS LONG
 *  AS THE DEVELOPER AGREES TO THE LICENSE THAT IS
 *  PROVIDED WITH THIS PACKAGE.
 *
 *********************************************************/

#include "StdInc.h"

#include <locale.h>
#include <filesystem>

using namespace std;
namespace fs = std::filesystem;

ILuaModuleManager10 *pModuleManager = NULL;
lua_State *mainVM = NULL;
extern map < AMX *, AMXPROPS > loadedAMXs;

#ifdef WIN32
static bool winsockInitialized = false;
#endif

static AMX_NATIVE originalMysqlConnect = NULL;
static AMX_NATIVE originalRedisConnect = NULL;

static string readPawnString(AMX *amx, cell address)
{
	cell *physicalAddress = NULL;
	int length = 0;
	if (amx_GetAddr(amx, address, &physicalAddress) != AMX_ERR_NONE || !physicalAddress)
		return "<invalid>";
	amx_StrLen(physicalAddress, &length);
	vector<char> value(length + 1, '\0');
	amx_GetString(value.data(), physicalAddress, 0, value.size());
	return string(value.data());
}

static cell AMX_NATIVE_CALL traceMysqlConnect(AMX *amx, const cell *params)
{
	string host = readPawnString(amx, params[1]);
	string user = readPawnString(amx, params[2]);
	string database = readPawnString(amx, params[3]);
	printf("[MRP DB TRACE] mysql_connect host='%s' user='%s' database='%s' password_length=%u\n",
		host.c_str(), user.c_str(), database.c_str(),
		(unsigned int)readPawnString(amx, params[4]).size());
	return originalMysqlConnect ? originalMysqlConnect(amx, params) : 0;
}

static cell AMX_NATIVE_CALL traceRedisConnect(AMX *amx, const cell *params)
{
	string host = readPawnString(amx, params[1]);
	printf("[MRP DB TRACE] Redis_Connect host='%s' port=%d password_length=%u\n",
		host.c_str(), (int)params[2],
		(unsigned int)readPawnString(amx, params[3]).size());
	return originalRedisConnect ? originalRedisConnect(amx, params) : 1;
}

static int AMXAPI registerWithDatabaseTrace(AMX *amx, const AMX_NATIVE_INFO *nativeList, int number)
{
	vector<AMX_NATIVE_INFO> traced;
	int count = number;
	if (count < 0) {
		count = 0;
		while (nativeList[count].name != NULL)
			count++;
	}
	traced.reserve(count + (number < 0 ? 1 : 0));
	for (int index = 0; index < count; index++) {
		AMX_NATIVE_INFO native = nativeList[index];
		if (strcmp(native.name, "mysql_connect") == 0) {
			originalMysqlConnect = native.func;
			native.func = traceMysqlConnect;
		} else if (strcmp(native.name, "Redis_Connect") == 0) {
			originalRedisConnect = native.func;
			native.func = traceRedisConnect;
		}
		traced.push_back(native);
	}
	if (number < 0)
		traced.push_back({ NULL, NULL });
	return amx_Register(amx, traced.data(), number);
}

enum PLUGIN_DATA_TYPE
{
	PLUGIN_DATA_LOGPRINTF		= 0x00,	// void (*logprintf)(char* format, ...)

	PLUGIN_DATA_AMX_EXPORTS		= 0x10,	// void* AmxFunctionTable[]    (see PLUGIN_AMX_EXPORT)
	PLUGIN_DATA_CALLPUBLIC_FS	= 0x11, // int (*AmxCallPublicFilterScript)(char *szFunctionName)
	PLUGIN_DATA_CALLPUBLIC_GM	= 0x12, // int (*AmxCallPublicGameMode)(char *szFunctionName)
};

void *pluginInitData[0x13];

void *amxFunctions[] = {
	0,
	0,
	0,
	(void*)&amx_Allot,
	(void*)&amx_Callback,
	(void*)&amx_Cleanup,
	(void*)&amx_Clone,
	(void*)&amx_Exec,
	(void*)&amx_FindNative,
	(void*)&amx_FindPublic,
	(void*)&amx_FindPubVar,
	(void*)&amx_FindTagId,
	(void*)&amx_Flags,
	(void*)&amx_GetAddr,
	(void*)&amx_GetNative,
	(void*)&amx_GetPublic,
	(void*)&amx_GetPubVar,
	(void*)&amx_GetString,
	(void*)&amx_GetTag,
	(void*)&amx_GetUserData,
	(void*)&amx_Init,
	(void*)&amx_InitJIT,
	(void*)&amx_MemInfo,
	(void*)&amx_NameLength,
	(void*)&amx_NativeInfo,
	(void*)&amx_NumNatives,
	(void*)&amx_NumPublics,
	(void*)&amx_NumPubVars,
	(void*)&amx_NumTags,
	(void*)&amx_Push,
	(void*)&amx_PushArray,
	(void*)&amx_PushString,
	(void*)&amx_RaiseError,
	(void*)&registerWithDatabaseTrace,
	(void*)&amx_Release,
	(void*)&amx_SetCallback,
	(void*)&amx_SetDebugHook,
	(void*)&amx_SetString,
	(void*)&amx_SetUserData,
	(void*)&amx_StrLen,
	(void*)&amx_UTF8Check,
	(void*)&amx_UTF8Get,
	(void*)&amx_UTF8Len,
	(void*)&amx_UTF8Put
};

MTAEXPORT bool InitModule(ILuaModuleManager10 *pManager, char *szModuleName, char *szAuthor, float *fVersion)
{
	#ifdef WIN32
	WSADATA winsockData;
	if (WSAStartup(MAKEWORD(2, 2), &winsockData) != 0) {
		return false;
	}
	winsockInitialized = true;
	#endif

	pModuleManager = pManager;

	// Set the module info
	strncpy(szModuleName, MODULE_NAME, MAX_INFO_LENGTH);
	strncpy(szAuthor, MODULE_AUTHOR, MAX_INFO_LENGTH);
	(*fVersion) = MODULE_VERSION;

	// Initiate plugin data
	pluginInitData[PLUGIN_DATA_LOGPRINTF] = (void*)&logprintf;
	pluginInitData[PLUGIN_DATA_AMX_EXPORTS] = amxFunctions;
	pluginInitData[PLUGIN_DATA_CALLPUBLIC_FS] = (void*)&AMXCallPublicFilterScript;
	pluginInitData[PLUGIN_DATA_CALLPUBLIC_GM] = (void*)&AMXCallPublicGameMode;

	char* localeInfo = setlocale(LC_ALL, "Russian");

	string PATH = getenv("PATH");
	PATH += ";mods/deathmatch/resources/amx/plugins/";
	setenv_portable("PATH", PATH.c_str(), 1);

	//Setup environment variables
	fs::path scriptfilespath = fs::canonical(fs::current_path() / fs::path("mods/deathmatch/resources/amx/scriptfiles"));

	const char* envvar = getenv_portable("MTA_SCRIPTFILESDIR");
	if (envvar != NULL)
		scriptfilespath = envvar;

	if (exists(scriptfilespath)) {
		setenv_portable("AMXFILE", scriptfilespath.string().c_str(), 0);
	} else {
		pModuleManager->ErrorPrintf("scriptfiles directory doesn't exist at: %s\n", scriptfilespath.string());
	}

	return true;
}

void logprintf(char *fmt, ...) {
	vprintf(fmt, (va_list)(&fmt + 1));
	printf("\n");
}

int AMXCallPublicFilterScript(char *fnName) {
	int fnIndex = -1;
	cell ret = 0;
	for (const auto& it : loadedAMXs) {
		if(amx_FindPublic(it.first, "OnFilterScriptInit", &fnIndex) != AMX_ERR_NONE)
			continue;
		if(amx_FindPublic(it.first, fnName, &fnIndex) != AMX_ERR_NONE)
			continue;
		amx_Exec(it.first, &ret, fnIndex);
		return ret;
	}
	return 0;
}

int AMXCallPublicGameMode(char *fnName) {
	int fnIndex = -1;
	cell ret = 0;
	for(const auto& it : loadedAMXs) {
		if(amx_FindPublic(it.first, "OnGameModeInit", &fnIndex) != AMX_ERR_NONE)
			continue;
		if(amx_FindPublic(it.first, fnName, &fnIndex) != AMX_ERR_NONE)
			continue;
		amx_Exec(it.first, &ret, fnIndex);
		return ret;
	}
	return 0;
}

MTAEXPORT void RegisterFunctions(lua_State *luaVM)
{
	if (pModuleManager && luaVM)
	{
		pModuleManager->RegisterFunction(luaVM, "amxIsPluginLoaded", CFunctions::amxIsPluginLoaded);
		pModuleManager->RegisterFunction(luaVM, "amxRegisterLuaPrototypes", CFunctions::amxRegisterLuaPrototypes);
		pModuleManager->RegisterFunction(luaVM, "amxVersion", CFunctions::amxVersion);
		pModuleManager->RegisterFunction(luaVM, "amxVersionString", CFunctions::amxVersionString);

		char resNameBuf[4];
		bool ok = pModuleManager->GetResourceName(luaVM, resNameBuf, 4);
		if (!ok || std::string(resNameBuf) != "amx")
			return;

		mainVM = luaVM;

		pModuleManager->RegisterFunction(luaVM, "amxLoadPlugin", CFunctions::amxLoadPlugin);
		pModuleManager->RegisterFunction(luaVM, "amxLoad", CFunctions::amxLoad);
		pModuleManager->RegisterFunction(luaVM, "amxCall", CFunctions::amxCall);
		pModuleManager->RegisterFunction(luaVM, "amxMTReadDATCell", CFunctions::amxMTReadDATCell);
		pModuleManager->RegisterFunction(luaVM, "amxMTWriteDATCell", CFunctions::amxMTWriteDATCell);
		pModuleManager->RegisterFunction(luaVM, "amxReadString", CFunctions::amxReadString);
		pModuleManager->RegisterFunction(luaVM, "amxWriteString", CFunctions::amxWriteString);
		pModuleManager->RegisterFunction(luaVM, "amxUnload", CFunctions::amxUnload);
		pModuleManager->RegisterFunction(luaVM, "amxUnloadAllPlugins", CFunctions::amxUnloadAllPlugins);

		pModuleManager->RegisterFunction(luaVM, "sqlite3OpenDB", CFunctions::sqlite3OpenDB);
		pModuleManager->RegisterFunction(luaVM, "sqlite3Query", CFunctions::sqlite3Query);
		pModuleManager->RegisterFunction(luaVM, "sqlite3CloseDB", CFunctions::sqlite3CloseDB);

		pModuleManager->RegisterFunction(luaVM, "cell2float", CFunctions::cell2float);
		pModuleManager->RegisterFunction(luaVM, "float2cell", CFunctions::float2cell);

		lua_newtable(luaVM);
		lua_setfield(luaVM, LUA_REGISTRYINDEX, "amx");
	}
}

MTAEXPORT bool DoPulse(void)
{
	for (const auto& ProcessTick : vecPfnProcessTick)
	{
		ProcessTick();
	}
	return true;
}

MTAEXPORT bool ShutdownModule(void)
{
	#ifdef WIN32
	if (winsockInitialized) {
		WSACleanup();
		winsockInitialized = false;
	}
	#endif
	return true;
}
