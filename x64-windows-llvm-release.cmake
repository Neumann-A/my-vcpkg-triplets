set(VCPKG_BUILD_TYPE release)
# Be aware: This breaks binary caching for this triplet.
# Files included in the triplet file are not hashed!
include("${CMAKE_CURRENT_LIST_DIR}/x64-windows-llvm.cmake")

