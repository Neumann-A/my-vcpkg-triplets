include_guard(GLOBAL)

function(get_vcpkg_triplet_variables)
  include("${CMAKE_CURRENT_LIST_DIR}/../${VCPKG_TARGET_TRIPLET}.cmake")
  # Be carefull here you don't want to pull in all variables from the triplet!
  # Port is not defined!
  set(VCPKG_CRT_LINKAGE "${VCPKG_CRT_LINKAGE}" PARENT_SCOPE) # This is also forwarded by vcpkg itself
endfunction()

get_vcpkg_triplet_variables()
# Set C standard.
set(CMAKE_C_STANDARD 11 CACHE STRING "")
set(CMAKE_C_STANDARD_REQUIRED ON CACHE STRING "")
set(CMAKE_C_EXTENSIONS ON CACHE STRING "")
set(std_c_flags "-std:c11 /Zc:__STDC__")

# Set C++ standard.
set(CMAKE_CXX_STANDARD 20 CACHE STRING "")
set(CMAKE_CXX_STANDARD_REQUIRED ON CACHE STRING "")
set(CMAKE_CXX_EXTENSIONS OFF CACHE STRING "")
set(std_cxx_flags "/permissive- -std:c++20 /Zc:__cplusplus")

# Set Windows definitions:
set(windows_defs "/DWIN32 /D_WIN64 /D_WINDOWS /D_WIN32_WINNT=0x0A00 /DWINVER=0x0A00")
string(APPEND windows_defs " /D_CRT_SECURE_NO_DEPRECATE /D_CRT_SECURE_NO_WARNINGS /D_CRT_NONSTDC_NO_DEPRECATE")
string(APPEND windows_defs " /D_ATL_SECURE_NO_DEPRECATE /D_SCL_SECURE_NO_WARNINGS")

# Set runtime library.
set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>$<$<STREQUAL:${VCPKG_CRT_LINKAGE},dynamic>:DLL>" CACHE STRING "")
if(VCPKG_CRT_LINKAGE STREQUAL "dynamic")
  set(VCPKG_CRT_FLAG "/MD")
  set(VCPKG_DBG_FLAG "/Zi")
elseif(VCPKG_CRT_LINKAGE STREQUAL "static")
  set(VCPKG_CRT_FLAG "/MT")
  set(VCPKG_DBG_FLAG "/Zi")
else()
  message(FATAL_ERROR "Invalid VCPKG_CRT_LINKAGE: \"${VCPKG_CRT_LINKAGE}\".")
endif()

# Set charset flag.
set(CHARSET_FLAG "/utf-8")
if(DEFINED VCPKG_SET_CHARSET_FLAG AND NOT VCPKG_SET_CHARSET_FLAG)
  set(CHARSET_FLAG "")
endif()

set(CMAKE_CL_NOLOGO "/nologo" CACHE STRING "")

# Set compiler flags.
set(CLANG_FLAGS "/clang:-fasm /clang:-fopenmp-simd")
# Disable logo for compiler and linker.
if(NOT TOOLCHAIN_NO_LTO)
  set(CLANG_C_LTO_FLAGS "/clang:-flto=full /clang:-fuse-ld=lld")
  set(CLANG_CXX_LTO_FLAGS "/clang:-fwhole-program-vtables") # will be added in addition to CLANG_C_LTO_FLAGS
else()
  set(CLANG_C_LTO_FLAGS "")
  set(CLANG_CXX_LTO_FLAGS "")
endif()

# Setup try_compile correctly. 
list(APPEND CMAKE_TRY_COMPILE_PLATFORM_VARIABLES VCPKG_CRT_LINKAGE 
                                                 VCPKG_C_FLAGS VCPKG_CXX_FLAGS
                                                 VCPKG_C_FLAGS_DEBUG VCPKG_CXX_FLAGS_DEBUG
                                                 VCPKG_C_FLAGS_RELEASE VCPKG_CXX_FLAGS_RELEASE
                                                 VCPKG_LINKER_FLAGS VCPKG_LINKER_FLAGS_RELEASE VCPKG_LINKER_FLAGS_DEBUG
                                                 VCPKG_SET_CHARSET_FLAG
                                                 )

