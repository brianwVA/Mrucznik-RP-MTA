local amxfiles = {
	path.join(_SCRIPT_DIR, "amx.c"),
	path.join(_SCRIPT_DIR, "amxaux.c"),
	path.join(_SCRIPT_DIR, "amxcons.c"),
	path.join(_SCRIPT_DIR, "amxcore.c"),
	path.join(_SCRIPT_DIR, "amxfile.c"),
	path.join(_SCRIPT_DIR, "amxstring.c"),
	path.join(_SCRIPT_DIR, "amxtime.c"),
	path.join(_SCRIPT_DIR, "amxfloat.c"),
}

project "amx"
	language "C++"
	kind "StaticLib"

	defines {
		-- From original project, but causes crashes?
		"AMX_DONT_RELOCATE",
		"FLOATPOINT",
	}

	filter "system:windows"
		-- "__WIN32__" needed for amx
		defines { "__WIN32__" }

	filter {}

	vpaths {
		["Headers/*"] = {"**.h", "../linux/**.h"},
		["Sources/*"] = amxfiles,
	}

	files(amxfiles)

	filter "system:linux"
		files { path.join(_SCRIPT_DIR, "../linux/getch.c") }

	filter "system:linux"
		includedirs { path.join(_SCRIPT_DIR, "../linux") }

	filter "system:windows"
		links { "winmm" }
