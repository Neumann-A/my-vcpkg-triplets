set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_CRT_LINKAGE dynamic)
# Untracked since vcpkg will track the compiler version.
set(VCPKG_ENV_PASSTHROUGH_UNTRACKED "LLVMInstallDir;LLVMToolsVersion") 
set(VCPKG_QT_TARGET_MKSPEC win32-clang-msvc) # For qmake

# Get Program Files root to lookup possible LLVM installation
if (DEFINED ENV{ProgramW6432})
    file(TO_CMAKE_PATH "$ENV{ProgramW6432}" PROG_ROOT)
else()
    file(TO_CMAKE_PATH "$ENV{PROGRAMFILES}" PROG_ROOT)
endif()
if (DEFINED ENV{LLVMInstallDir})
    file(TO_CMAKE_PATH "$ENV{LLVMInstallDir}/bin" POSSIBLE_LLVM_BIN_DIR)
else()
    file(TO_CMAKE_PATH "${PROG_ROOT}/LLVM/bin" POSSIBLE_LLVM_BIN_DIR)
endif()

# Per port customization
include("${CMAKE_CURRENT_LIST_DIR}/x64-windows-llvm/x64-windows-llvm.port.cmake")

set(VCPKG_POLICY_SKIP_ARCHITECTURE_CHECK enabled)
set(VCPKG_POLICY_SKIP_DUMPBIN_CHECKS enabled)
set(VCPKG_LOAD_VCVARS_ENV ON)

set(VCPKG_C_FLAGS "-arch:AVX")
set(VCPKG_CXX_FLAGS "${VCPKG_C_FLAGS}")