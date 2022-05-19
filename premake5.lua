project "yaml-cpp"
	kind "StaticLib"
	language "C++"
	staticruntime "on"

    targetdir 	("%{wks.location}/bin/%{prj.name}/" .. outputDir)
    objdir 		("%{wks.location}/obj/%{prj.name}/" .. outputDir)

	files
	{
		"src/**.h",
		"src/**.cpp",
		
		"include/**.h"
	}

	includedirs
	{
		"include"
	}
	
	defines
	{
		"YAML_CPP_STATIC_DEFINE"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
        
	filter "configurations:Debug"
	runtime "Debug"
	symbols "on"

	filter "configurations:ARMd"
		runtime "Debug"
        symbols "on"

	filter "configurations:ARM64d"
		runtime "Debug"
		symbols "on"

    filter "configurations:Release"
		runtime "Release"
        optimize "on"

	filter "configurations:ARM"
		runtime "Release"
		optimize "on"

	filter "configurations:ARM64"
		runtime "Release"
		optimize "on"
