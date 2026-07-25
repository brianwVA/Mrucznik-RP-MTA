local amxfiles = {
	"amx/amx.c",
	"amx/amxaux.c",
	"amx/amxcons.c",
	"amx/amxcore.c",
	"amx/amxfile.c",
	"amx/amxstring.c",
	"amx/amxtime.c",
	"amx/amxfloat.c",
}

project "amx"
	language "C++"
	kind "StaticLib"

	defines {
		-- From original project, but causes crashes?
		-- "AMX_DONT_RELOCATE"
		"FLOATPOINT",
	}

	filter "system:windows"
		-- "__WIN32__" needed for amx
		defines { "__WIN32__" }

	vpaths {
		["Headers/*"] = {"**.h", "../linux/**.h"},
		["Sources/*"] = amxfiles,
	}

	files {
		amxfiles,
	}

	filter "system:linux"
		files { "linux/getch.c" }

	filter "system:linux"
		includedirs { "linux" }

	filter "system:windows"
		links { "winmm" }
