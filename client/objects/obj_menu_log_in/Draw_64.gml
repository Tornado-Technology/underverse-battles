draw_reset();

var width = room_width;
var width_center = room_width / 2;

if (show_loading) {
	draw_set_font(global._font_main_determination);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text_outlined(width_center, 30, c_white, c_black, text_waiting_for_login);
}

draw_reset();