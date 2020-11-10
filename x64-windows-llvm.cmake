set(VCPKG_TARGET_ARCHITECTURE x64)
set(VCPKG_LIBRARY_LINKAGE static)
set(VCPKG_CRT_LINKAGE dynamic)

if(NOT PORT MATCHES "(boost|hwloc)")
    set(VCPKG_CHAINLOAD_TOOLCHAIN_FILE "E:/Repos/AllProjects/my-vcpkg-triplets/x64-windows-llvm.toolchain.cmake")
    if(DEFINED VCPKG_PLATFORM_TOOLSET)
        set(VCPKG_PLATFORM_TOOLSET llvm)
    endif()
endif()

set(VCPKG_POLICY_SKIP_ARCHITECTURE_CHECK enabled)
set(VCPKG_POLICY_SKIP_DUMPBIN_CHECKS enabled)
set(VCPKG_LOAD_VCVARS_ENV ON)

set(VCPKG_C_FLAGS "/arch:AVX")
set(VCPKG_CXX_FLAGS "${VCPKG_C_FLAGS} /EHsc /GR")