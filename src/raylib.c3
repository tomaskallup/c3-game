module raylib;

def Color = char[<4>];
def Vector2 = float[<2>];

extern fn void init_window(int width, int height, char *title) @extern("InitWindow");
extern fn void close_window() @extern("CloseWindow");
extern fn void set_target_fps(int fps) @extern("SetTargetFPS");
extern fn bool window_should_close() @extern("WindowShouldClose");
extern fn void begin_drawing() @extern("BeginDrawing");
extern fn void clear_background(Color color) @extern("ClearBackground");
extern fn void end_drawing() @extern("EndDrawing");
extern fn float get_frame_time() @extern("GetFrameTime");
extern fn void draw_rectangle_v(Vector2 position, Vector2 size, Color color) @extern("DrawRectangleV");
extern fn int get_screen_width() @extern("GetScreenWidth");
extern fn int get_screen_height() @extern("GetScreenHeight");
extern fn Color color_from_hsv(float hue, float saturation, float value) @extern("ColorFromHSV");
extern fn int get_random_value(int min, int max) @extern("GetRandomValue");
