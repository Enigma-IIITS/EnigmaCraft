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
