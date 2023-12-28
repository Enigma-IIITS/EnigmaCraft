
os :=
arch :=

ifeq ($(OS),Windows_NT)
    os = WIN
else
    ifeq ($(shell uname -s),Darwin)
        os = OSX
        ifeq ($(shell uname -m),arm64)
            arch = arm64
        else
            arch = x86_64
        endif
    else ifeq ($(shell uname -s),Linux)
        os = LNX
    else
		echo "Not Supported!"
    endif
endif

sources := src/main.c
c_flags :=
includes := -I lib -I lib/sokol

ifeq ($(os), OSX)
    sources += lib/sokol.m
    c_flags += -DSOKOL_METAL -fobjc-arc -framework Metal -framework Cocoa -framework MetalKit -framework Quartz -framework AudioToolbox
else
    sources += lib/sokol.c
    ifeq ($(os), WIN)
        c_flags += -DSOKOL_D3D11 -mwin32 -lkernel32 -luser32 -lshell32 -ldxgi -ld3d11 -lole32 -lgdi32
    else
        c_flags += -DSOKOL_GLCORE33 -pthread -lGL -ldl -lm -lX11 -lasound -lXi -lXcursor
    endif
endif

all: compile_shader compile_app

compile_app:
	cc $(sources) -o build/enigma_craft $(c_flags) $(includes)

compile_shader:
ifeq ($(os), WIN)
	lib/sokol-tools-bin/bin/win32/sokol-shdc -i src/shader.glsl -o src/shader.glsl.h -l hlsl5
else ifeq ($(os), OSX)
    ifeq ($(arch), arm64)
		lib/sokol-tools-bin/bin/osx_arm64/sokol-shdc -i src/shader.glsl -o src/shader.glsl.h -l metal_macos
    else
		lib/sokol-tools-bin/bin/osx/sokol-shdc -i src/shader.glsl -o src/shader.glsl.h -l metal_macos
    endif
else ifeq ($(os), LNX)
	lib/sokol-tools-bin/bin/linux/sokol-shdc -i src/shader.glsl -o src/shader.glsl.h -l glsl330
endif
