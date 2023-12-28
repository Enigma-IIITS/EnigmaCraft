# EnigmaCraft
EnigmaCraft is Minecraft clone made by Core Members of Enigma Club

# Building

## MacOS 

- Open Terminal in the project root and build the shader:

For x86_64:
```
lib/sokol-tools-bin/bin/osx/sokol-shdc -i src/shader.glsl -o src/shader.glsl.h -l metal_macos
```
For ARM64:
```
lib/sokol-tools-bin/bin/osx_arm64/sokol-shdc -i src/shader.glsl -o src/shader.glsl.h -l metal_macos
```
- Build the app:
```
cc src/main.c lib/sokol.m -o build/enigma_craft -DSOKOL_METAL -fobjc-arc -I lib/sokol -I lib -framework Metal -framework Cocoa -framework MetalKit -framework Quartz -framework AudioToolbox
```
- Run the app:
```
./build/enigma_craft
```

## Linux

- Open Terminal in the project root and build the shader:

For x86_64:
```
lib/sokol-tools-bin/bin/linux/sokol-shdc -i src/shader.glsl -o src/shader.glsl.h -l glsl330
```
- Build the app:
```
cc src/main.c lib/sokol.c -o build/enigma_craft -DSOKOL_GLCORE33 -pthread -I lib/sokol -I lib -lGL -ldl -lm -lX11 -lasound -lXi -lXcursor
```
- Run the app:
```
./build/enigma_craft
```

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

## Web (WASM + Webgl)

- Open Terminal in project root and build the shader:
```
lib/sokol-tools-bin/bin/[platform]/sokol-shdc -i src/shader.glsl -o src/shader.glsl.h -l glsl300es
```
- Build the app:
```
emcc src/main.c lib/sokol.c -o build_web/enigma_craft.html -DSOKOL_GLES3 -I lib/sokol -I lib -sUSE_WEBGL2 --shell-file=shell.html
```
- Run the app:
```
emrun build_web/enigma_craft.html
```

