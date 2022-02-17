# my-vcpkg-triplet
Small collection of vcpkg triplets

## How to use?
pass the parameter `--overlay-triplets=<relative-or-absolute-path-to-checkout>` to `vcpkg install` or  
set/append `<relative-or-absolute-path-to-checkout>` to `VCPKG_OVERLAY_TRIPLETS` in cmake when using the vcpkg toolchain. 