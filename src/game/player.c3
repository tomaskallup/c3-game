module game::player;

import raylib5;

import game::go;

struct Player (go::GameObject) {
  rl::Vector2 position;
  rl::Vector2 size;
  rl::Camera2D camera;
}

fn void Player.update(Player *self) @dynamic
{
  self.camera.offset = { rl::getScreenWidth()/2.0f, rl::getScreenHeight()/2.0f };
  // Camera panning
  if (rl::isMouseButtonDown(rl::MouseButton.LEFT)) {
    Vector2 delta = rl::getMouseDelta();
    self.camera.target.x -= delta.x;
    self.camera.target.y -= delta.y;
  } else {
    self.camera.target = {
      self.position.x + self.size.x / 2.0f,
      self.position.y + self.size.y / 2.0f
    };
  }

  // Camera zoom controls
  self.camera.zoom += ((float)rl::getMouseWheelMove()*0.05f);

  // Camera reset (zoom and rotation)
  if (rl::isKeyPressed(rl::KEY_R))
  {
    self.camera.zoom = 1.0f;
    self.camera.rotation = 0.0f;
  }

  if (self.camera.zoom > 2.0f) { self.camera.zoom = 2.0f; }
  else if (self.camera.zoom < 0.5f) { self.camera.zoom = 0.5f; }

  // Player movement
  if (rl::isKeyDown(rl::KEY_RIGHT)) { self.position.x += 2; }
  else if (rl::isKeyDown(rl::KEY_LEFT)) { self.position.x -= 2; }
  if (rl::isKeyDown(rl::KEY_DOWN)) { self.position.y += 2; }
  else if (rl::isKeyDown(rl::KEY_UP)) { self.position.y -= 2; }
}

fn void Player.render(Player *self) @dynamic
{
  rl::drawRectangleV(self.position, self.size, rl::RED);
}

fn Player init(rl::Vector2 position, rl::Vector2 size) {
  Player player;
  player.position = position;
  player.size = size;
  rl::Camera2D camera;
  camera.target = {
    player.position.x + player.size.x / 2.0f,
    player.position.y + player.size.y / 2.0f
  };
  camera.offset = { rl::getScreenWidth()/2.0f, rl::getScreenHeight()/2.0f };
  camera.rotation = 0.0f;
  camera.zoom = 1.0f;

  return player;
}
