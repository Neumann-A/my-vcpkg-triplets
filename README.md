# my-vcpkg-triplet
Small collection of vcpkg triplets

## How to use?
pass the parameter `--overlay-triplets=<relative-or-absolute-path-to-checkout>` to `vcpkg install` or  
set/append `<relative-or-absolute-path-to-checkout>` to `VCPKG_OVERLAY_TRIPLETS` in cmake when using the vcpkg toolchain. 

## Triplets:

x64-linux-dynamic-release: A release only x64-linux-dynamic triplet

x64-windows-llvm(-static|-release): First generation windows triplets using (mostly) llvm with static library linkage.

x64-win-llvm: Next generation of windows triplets using (mostly) llvm. 
