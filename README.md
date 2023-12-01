# raylib-freebasic -> v5.0

[FreeBasic](https://freebasic.net/) bindings for [raylib](https://github.com/raysan5/raylib)  
  
Lib | Linux | Windows | Mac | BSD |
--- | ----- | ------- | --- | --- |
raylib.bi | tested | tested |  not tested |  not tested
raymath.bi | tested | tested |  not tested |  not tested
raygui.bi | tested | not tested | not tested | not tested

## example
```basic
#include "raylib.bi"

Dim As Const Integer screen_width = 800
Dim As Const Integer screen_height = 450

InitWindow(screen_width, screen_height, "Hello World")
SetTargetFPS(60)

While Not WindowShouldClose()
	BeginDrawing()
		ClearBackground(RAYWHITE)
		DrawText("Hello World from raylib and FreeBasic!", 200, 200, 20, GRAY)
	EndDrawing()
Wend

CloseWindow()
```

![Example](example.png)  
  
    

## compiling
you need to have raylib on your device, tested with shared lib but static lib should also work

### raylib

#### linux
include **raylib.bi** in your project and it should work, all of dependencies are defined inside the file

#### windows
include **raylib.bi** in your project and it should work, all of dependencies are defined inside the file
i primarily use linux so tests were mostly made using mingw and wine without encountering any issues
some users had problems with linking, changing ``` #include "raylib" ``` to ``` #include "raylibdll" ``` helped

### raygui
you have to either compile raygui with raylib or as a separate lib
for more info i advice looking into this [thread](https://github.com/WIITD/raylib-freebasic/issues/7)

for more info about building raylib visit [official wiki](https://github.com/raysan5/raylib/wiki)
and for raygui check [official repo](https://github.com/raysan5/raygui#building)

## examples
[examples][https://github.com/WIITD/raylib-freebasic/tree/main/examples]
simple game i wrote that uses [raylib-freebasic](https://github.com/WIITD/asteroid_field/tree/raylib-freebasic)
