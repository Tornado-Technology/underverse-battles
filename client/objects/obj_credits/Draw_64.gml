// GUI
var width = display_get_gui_width();
// ###

draw_reset();

// Main
draw_set_font(global._font_main_determination);
draw_set_halign(fa_center);

for (var i = 0; i < str_num; i++) {
	draw_one_string(i);
}