#include "../../raylib.bi"

#define MAX_COLUMNS 20

dim as integer screen_width = 800
dim as integer screen_height = 450

InitWindow(screen_width, screen_height, "raylib-freebasic [core] example - 3d camera first person")

dim as camera cam
cam.position = vector3(4.0, 2.0, 4.0)
cam.target = vector3(0, 1.8, 0)
cam.up = vector3(0, 1, 0)
cam.fovy = 60
cam.projection = CAMERA_PERSPECTIVE

dim as short heights(MAX_COLUMNS)
dim as vector3 positions(MAX_COLUMNS)
dim as rlcolor col(MAX_COLUMNS)

for i as integer = 0 to MAX_COLUMNS
  heights(i) = GetRandomValue(1, 12)
  positions(i) = vector3(GetRandomValue(-15, 15), heights(i)/2.0, GetRandomValue(-15, 15))
  col(i) = rlcolor(GetRandomValue(20, 255), GetRandomValue(10, 55), 30, 255)
next i

SetCameraMode(cam, CAMERA_FIRST_PERSON)

SetTargetFPS(60)

while not WindowShouldClose()

  UpdateCamera(@cam)

  BeginDrawing()
    
    ClearBackground(RAYWHITE)
  
    BeginMode3D(cam)
      
      DrawPlane(vector3(0.0, 0.0, 0.0), vector2(32.0, 32.0), LIGHTGRAY)
      DrawCube(vector3(-16.0, 2.5, 0.0), 1.0, 5.0, 32.0, BLUE)
      DrawCube(vector3(16.0, 2.5, 0.0), 1.0, 5.0, 32.0, LIME)
      DrawCube(vector3(0.0, 2.5, 16.0), 32.0, 5.0, 1.0, GOLD)
      
      for j as integer = 0 to MAX_COLUMNS
        DrawCube(positions(j), 2.0, heights(j), 2.0, col(j))
        DrawCubeWires(positions(j), 2.0, heights(j), 2.0, MAROON)
      next j

    EndMode3D()
    
    DrawRectangle( 10, 10, 220, 70, Fade(SKYBLUE, 0.5))
    DrawRectangleLines( 10, 10, 220, 70, BLUE)

    DrawText("First person camera default controls:", 20, 20, 10, BLACK)
    DrawText("- Move with keys: W, A, S, D", 40, 40, 10, DARKGRAY)
    DrawText("- Mouse move to look around", 40, 60, 10, DARKGRAY)


  EndDrawing()
wend

CloseWindow()
