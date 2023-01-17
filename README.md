[![CI](https://github.com/Neumann-A/my-vcpkg-triplets/actions/workflows/ci.yml/badge.svg)](https://github.com/Neumann-A/my-vcpkg-triplets/actions/workflows/ci.yml)
# my-vcpkg-triplet
Small collection of vcpkg triplets

## How to use?
pass the parameter `--overlay-triplets=<relative-or-absolute-path-to-checkout>` to `vcpkg install` or  
set/append `<relative-or-absolute-path-to-checkout>` to `VCPKG_OVERLAY_TRIPLETS` in cmake when using the vcpkg toolchain. 

## Triplets:

`x64-linux-dynamic-release`: A release only `x64-linux-dynamic` triplet

`x64-windows-llvm(-static|-release)`: First generation windows triplets using (mostly) llvm with static library linkage.


`x64-win-llvm`: Next generation of windows triplets using (mostly) llvm.  
`x64-win-llvm-lto`: `x64-win-llvm` with LTO enabled in release builds (LTO only works with release build flags)  
`x64-win-llvm-san`: `x64-win-llvm` with Sanitizers enabled in release builds (Sanitizers only work for release builds due to LLVM not shipping the libs build against the debug CRT)  
`x64-win-llvm-lto-san`: `x64-win-llvm` with LTO and sanitizers enableded (only for release)  
`x64-win-llvm(-lto)?(-san)?-static(-md)?`: Same as the above triplets but with static library linkage (and dynamic CRT linkage if `-md`); `-san` without `-md` is unsupported due to limitations of the meson build system.

`<above-triplet>-rel(ease)?` : Release only variant of the triplet