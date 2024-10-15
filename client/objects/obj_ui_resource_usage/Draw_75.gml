draw_reset();

draw_set_font(font_console_mini);
draw_set_halign(fa_right);

var width  = display_get_gui_width();
var height = display_get_gui_height();

var draw_x = width - 2;
var draw_y = 5;

if (show_ping) {
	ping_text.draw(draw_x, draw_y);
	draw_y += 8;	
}

if (frame_rate == frame_rate_tpye.fps || frame_rate == frame_rate_tpye.fps_and_real_fps) {
	fps_text.draw(draw_x, draw_y);
	draw_y += 8;
}

if (frame_rate == frame_rate_tpye.real_fps || frame_rate == frame_rate_tpye.fps_and_real_fps) {
	real_fps_text.draw(draw_x, draw_y);
	draw_y += 8;
}

if (development_mode && !(cinematic_mode && room != room_menu) || beta_test_mode) {
	build_text.draw(draw_x, draw_y);	
}
