# This triplet is tested in vcpkg ci via https://github.com/microsoft/vcpkg/pull/25897
set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_CRT_LINKAGE static)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_BUILD_TYPE release)

## Toolchain setup
set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "${CMAKE_CURRENT_LIST_DIR}/x64-win-llvm/x64-win-llvm.toolchain.cmake")
set(VCPKG_LOAD_VCVARS_ENV ON) # Setting VCPKG_CHAINLOAD_TOOLCHAIN_FILE deactivates automatic vcvars setup so reenable it!

if(DEFINED VCPKG_PLATFORM_TOOLSET)
    set(VCPKG_PLATFORM_TOOLSET ClangCL)
endif()
set(VCPKG_ENV_PASSTHROUGH_UNTRACKED "LLVMInstallDir;LLVMToolsVersion") # For the ClangCL toolset
set(VCPKG_QT_TARGET_MKSPEC win32-clang-msvc) # For Qt5

## Policy settings
set(VCPKG_POLICY_SKIP_ARCHITECTURE_CHECK enabled)
set(VCPKG_POLICY_SKIP_DUMPBIN_CHECKS enabled)

set(VCPKG_CMAKE_CONFIGURE_OPTIONS 
      "-DCMAKE_TRY_COMPILE_CONFIGURATION=Release"
      #"-DCMAKE_USER_MAKE_RULES_OVERRIDE=${CMAKE_CURRENT_LIST_DIR}/x64-win-llvm/Platform/Clang-CL-override.cmake"
      #"-DCMAKE_USER_MAKE_RULES_OVERRIDE_C=${CMAKE_CURRENT_LIST_DIR}/x64-win-llvm/Platform/Clang-CL-C.cmake"
      #"-DCMAKE_USER_MAKE_RULES_OVERRIDE_CXX=${CMAKE_CURRENT_LIST_DIR}/x64-win-llvm/Platform/Clang-CL-CXX.cmake"
      "-DVCPKG_USE_SANITIZERS:BOOL=TRUE"
      "-DCMAKE_POLICY_DEFAULT_CMP0012=NEW"
      "-DCMAKE_POLICY_DEFAULT_CMP0056=NEW"
      "-DCMAKE_POLICY_DEFAULT_CMP0091=NEW"
      "-DCMAKE_POLICY_DEFAULT_CMP0092=NEW"
      "-DCMAKE_POLICY_DEFAULT_CMP0117=NEW"
      "-DCMAKE_POLICY_DEFAULT_CMP0126=NEW"
      "-DCMAKE_POLICY_DEFAULT_CMP0128=NEW"
      "-DCMAKE_POLICY_DEFAULT_CMP0137=NEW")

include("${CMAKE_CURRENT_LIST_DIR}/x64-win-llvm/extra_setup.cmake")
include("${CMAKE_CURRENT_LIST_DIR}/x64-win-llvm/port_specialization.cmake")
