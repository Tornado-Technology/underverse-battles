// Reset
draw_reset();

// Background
draw_set_alpha(background_alpha);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), background_color_main);
draw_sprite(background, image_frame, 0, background_y);

background_alpha = approach(background_alpha, background_target_alpha, 0.08);
background_y = approach(background_y, background_target_y, 0.2);

// Anykey
draw_set_font(global._font_main_determination);
draw_set_halign(fa_center);

anykey_y = lerp(anykey_y, elements_show ? anykey_target_y : anykey_start_y, 0.1);
if (anykey_y != anykey_start_y || anykey_alpha != 0) {
	anykey_alpha = wave(1, 0, 2, 0);
	draw_set_alpha(anykey_alpha);
	anykey_text.draw(width / 2, anykey_y);
}
	
// Reset
draw_reset();

// Logo
if (logo_alpha > 0) {
	draw_set_alpha(logo_alpha);
	logo_y = lerp(logo_y, is_logo_open ? logo_start_y : logo_target_y, 0.1);
	draw_sprite(logo, 0, logo_x, logo_y);
	draw_set_alpha(1);
}

// Blackout
if (blackout_alpha > 0) {
	draw_set_alpha(blackout_alpha);
	draw_set_color(c_black);
	draw_rectangle(0, 0, width, height, false);
	draw_reset();
}

// Pause
if (pause || !elements_show) exit;

// Title
draw_set_font(global._font_main_determination);
draw_set_halign(fa_center);
if (show_title) {
	draw_text_outlined(width / 2, height / 12, c_white, c_black, translate_get(title_text));
}

// Elements in page
var i = 0;
repeat (elements_count) {
	get_element_in_page(i).draw(page_x, page_y + page_element_offset * i, id);
	i++;
}
