include_guard(GLOBAL)

set(TOOLCHAIN_NO_LTO ON)
include("${CMAKE_CURRENT_LIST_DIR}/${VCPKG_TARGET_TRIPLET}.toolchain.cmake")
unset(TOOLCHAIN_NO_LTO)
