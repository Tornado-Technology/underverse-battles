draw_reset();

var width = display_get_gui_width();
var width_center = width / 2;
var width_third = width / 3;
var width_quarter = width / 4;

if (show_loading) {
	draw_set_font(global._font_main_determination);
	draw_set_halign(fa_center);
	draw_set_color(c_white);
	draw_text_outlined(width_center, 30, c_white, c_black, text_waiting_for_registration);
	draw_reset();
	exit;
}

// Write password rules
draw_set_font(global._font_main_mini);
draw_set_color(c_white);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text_ext(width_center, 60, text_rules, 16, 380);
draw_reset();