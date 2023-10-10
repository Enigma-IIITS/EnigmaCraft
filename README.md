# EnigmaCraft
EnigmaCraft is Minecraft clone made by Core Members of Enigma Club

# Building

## MacOS x86_64

- Open Terminal in the project root and build the shader:
```
lib/sokol-tools-bin/bin/osx/sokol-shdc -i src/shader.glsl -o src/shader.glsl.h -l metal_macos
```
- Build the app:
```
cc src/main.c lib/sokol.m -o build/enigma_craft -DSOKOL_METAL -fobjc-arc -I lib/sokol -I lib -framework Metal -framework Cocoa -framework MetalKit -framework Quartz -framework AudioToolbox
```
- Run the app:
```
./build/enigma_craft
```

## MacOS ARM64

- It is same as x86_64, but instead of `lib/sokol-tools-bin/bin/osx/sokol-shdc` in first step, do `lib/sokol-tools-bin/bin/osx_arm64/sokol-shdc`

## Windows

- Open Terminal in project root and build the shader:
```
lib/sokol-tools-bin/bin/win32/sokol-shdc -i src/shader.glsl -o src/shader.glsl.h -l hlsl5
```
- Build the app:
```
gcc src/main.c lib/sokol.c -o build/enigma_craft -mwin32 -O2 -DSOKOL_D3D11 -I lib/sokol -I lib -lkernel32 -luser32 -lshell32 -ldxgi -ld3d11 -lole32 -lgdi32
```
- Run the app:
```
./build/enigma_craft
```

