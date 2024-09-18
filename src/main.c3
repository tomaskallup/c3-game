module c3game;

import std::io;
import std::collections;

import game::player;

import raylib5;

const SCREEN_WIDTH = 800;
const SCREEN_HEIGHT = 600;
const ROW_LENGTH = SCREEN_WIDTH;
const ROW_HEIGHT = 200;
const ROW_COUNT = 5;
const PLAYER_SIZE = 20;

struct Building {
  rl::Rectangle rectangle;
  rl::Color color;
}

fn int main(String[] args)
{
  rl::initWindow(SCREEN_WIDTH, SCREEN_HEIGHT, "Test");
  rl::setTargetFPS(60);

  player::Player player = player::init({ 0, 280}, {PLAYER_SIZE, PLAYER_SIZE });
  List(<Building>) buildings;

  for (int row = 0; row < ROW_COUNT; row++)
  {
    float remainingLength = ROW_LENGTH;

    while(remainingLength > 120) {
      rl::Rectangle rec;
      rec.width = (float)rl::getRandomValue(80, 120);
      rec.height = (float)rl::getRandomValue(60, 150);
      rec.y = (float)row * ROW_HEIGHT;
      rec.x = ROW_LENGTH - remainingLength;
      
      // Random spacing between buildings
      remainingLength -= rec.width + (float)rl::getRandomValue(20, 60);

      Building building;
      building.rectangle = rec;
      building.color = rl::colorFromHSV(rl::getRandomValue(0, 360), 1.0f, 1.0f);

      buildings.push(building);

    }
  }

  while (!rl::windowShouldClose()) {
    rl::beginDrawing();
    defer rl::endDrawing();

    rl::clearBackground(rl::DARKGRAY);
    rl::beginMode2D(player.camera);

    player.update();

    foreach (building: buildings) {
      rl::drawRectangleRec(building.rectangle, building.color);
    }

    player.render();

    rl::drawLine((int)player.camera.target.x, -SCREEN_HEIGHT*10, (int)player.camera.target.x, SCREEN_HEIGHT*10, rl::GREEN);
    rl::drawLine(-SCREEN_WIDTH*10, (int)player.camera.target.y, SCREEN_WIDTH*10, (int)player.camera.target.y, rl::GREEN);

    rl::endMode2D();
  }

  rl::closeWindow();
  return 0;
}
