/// @desc Draw ping
draw_reset();
draw_set_font(global._font_main_determination);
draw_set_halign(fa_right);

var width = display_get_gui_width();
var height = display_get_gui_height();

if (show_msg) {
	draw_set_alpha(alpha);
	draw_text_outlined(width - 20, height - 50, color, c_black, str);
	draw_set_alpha(1);
}