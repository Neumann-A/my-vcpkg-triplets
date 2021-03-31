set(ANDROID_CPP_FEATURES "rtti exceptions" CACHE STRING "")
set(CMAKE_SYSTEM_NAME Android CACHE STRING "")
set(ANDROID_TOOLCHAIN clang CACHE STRING "")

if(DEFINED ENV{ANDROID_NATIVE_API_LEVEL})
    set(ANDROID_NATIVE_API_LEVEL $ENV{ANDROID_NATIVE_API_LEVEL})
else()
    set(ANDROID_NATIVE_API_LEVEL ${CMAKE_SYSTEM_VERSION} CACHE STRING "")
endif()
set(CMAKE_ANDROID_NDK_TOOLCHAIN_VERSION clang CACHE STRING "")

set(ANDROID_ABI armeabi-v7a-neon CACHE STRING "")
set(ANDROID_ARM_NEON TRUE)

if (VCPKG_CRT_LINKAGE STREQUAL "dynamic")
    set(ANDROID_STL c++_shared CACHE STRING "")
else()
    set(ANDROID_STL c++_static CACHE STRING "")
endif()

if(DEFINED ENV{ANDROID_NDK_HOME})
    set(ANDROID_NDK_HOME $ENV{ANDROID_NDK_HOME})
else()
	set(ANDROID_NDK_HOME "$ENV{ProgramData}/Microsoft/AndroidNDK64/android-ndk-r13b/")
	if(NOT EXISTS "${ANDROID_NDK_HOME}")
		# Use Xamarin default installation folder
		set(ANDROID_NDK_HOME "$ENV{ProgramFiles\(x86\)}/Android/android-sdk/ndk-bundle")
	endif()
endif()

if(NOT EXISTS "${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake")
    message(FATAL_ERROR "Could not find android ndk. Searched at ${ANDROID_NDK_HOME}")
endif()

include("${ANDROID_NDK_HOME}/build/cmake/android.toolchain.cmake")

if(NOT _VCPKG_ANDROID_TOOLCHAIN)
set(_VCPKG_ANDROID_TOOLCHAIN 1)
get_property( _CMAKE_IN_TRY_COMPILE GLOBAL PROPERTY IN_TRY_COMPILE )
if(NOT _CMAKE_IN_TRY_COMPILE)
    string(APPEND CMAKE_C_FLAGS " -fPIC ${VCPKG_C_FLAGS} ")
    string(APPEND CMAKE_CXX_FLAGS " -fPIC ${VCPKG_CXX_FLAGS} ")
    string(APPEND CMAKE_C_FLAGS_DEBUG " ${VCPKG_C_FLAGS_DEBUG} ")
    string(APPEND CMAKE_CXX_FLAGS_DEBUG " ${VCPKG_CXX_FLAGS_DEBUG} ")
    string(APPEND CMAKE_C_FLAGS_RELEASE " ${VCPKG_C_FLAGS_RELEASE} ")
    string(APPEND CMAKE_CXX_FLAGS_RELEASE " ${VCPKG_CXX_FLAGS_RELEASE} ")

    string(APPEND CMAKE_SHARED_LINKER_FLAGS " ${VCPKG_LINKER_FLAGS} ")
    string(APPEND CMAKE_EXE_LINKER_FLAGS " ${VCPKG_LINKER_FLAGS} ")
    string(APPEND CMAKE_SHARED_LINKER_FLAGS_DEBUG " ${VCPKG_LINKER_FLAGS_DEBUG} ")
    string(APPEND CMAKE_EXE_LINKER_FLAGS_DEBUG " ${VCPKG_LINKER_FLAGS_DEBUG} ")
    string(APPEND CMAKE_SHARED_LINKER_FLAGS_RELEASE " ${VCPKG_LINKER_FLAGS_RELEASE} ")
    string(APPEND CMAKE_EXE_LINKER_FLAGS_RELEASE " ${VCPKG_LINKER_FLAGS_RELEASE} ")
endif()
endif()