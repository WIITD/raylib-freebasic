#include "../../raylib.bi"

dim as integer screen_width = 800
dim as integer screen_height = 450

InitWindow(screen_width, screen_height, "raylib-freebasic [core] example - basic window")

SetTargetFPS(60)

while not WindowShouldClose()
  BeginDrawing()
  
    ClearBackground(RAYWHITE)

    DrawText("Congrats! You created your first window!", 190, 200, 20, LIGHTGRAY)

  EndDrawing()
wend

CloseWindow()
