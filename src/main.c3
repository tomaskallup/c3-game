module c3game;
import std::io;
import raylib;

fn int main(String[] args)
{
  raylib::init_window(800, 600, "Test");
  raylib::set_target_fps(60);

  while (!raylib::window_should_close()) {
    raylib::begin_drawing();
    defer raylib::end_drawing();

    raylib::clear_background({0x18, 0x18, 0x18, 0xFF});
    raylib::draw_rectangle_v({0,0}, {50,50}, {0xAA, 0x18, 0x18, 0xff});
  }
  raylib::close_window();
	return 0;
}
