draw_reset();
draw_set_font(global._font_main_determination);

if (!show)
	exit;

/* Draw soundtrack */
draw_name_song(soundtrack_x, soundtrack_y, text_color_standart, soundtrack_id);

for (var i = 1; i <= list_size - list_middle; i++) {
	if (soundtrack_id - i >= 0) {
		var color = i == list_size - list_middle ? text_color_last : text_color_standart;
		draw_name_song(soundtrack_x, soundtrack_y - soundtrack_step_y * i, color, soundtrack_id - i);
	}
	
	if (soundtrack_id + i < soundtrack_counts) {
		var color = i == list_size - list_middle ? text_color_last : text_color_standart;
		draw_name_song(soundtrack_x, soundtrack_y + soundtrack_step_y * i, color, soundtrack_id + i);
	}
}

// Composer
draw_reset();
draw_set_alpha(1);
draw_set_font(global._font_main_determination);
draw_set_halign(fa_center);
draw_set_color(c_white);

var custom = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK_CUSTOM);
var _string = custom == undefined ? translate_get("Menu.CustomSound.Undefined") : custom.name;
draw_text_outlined(line_x, line_y - line_height / 2 - 30 - wave(3, -3, 1, 0), c_white, c_black, translate_get("Menu.CustomSound.CustomSoundSet") + _string);

draw_text_outlined(soundtrack_x, 240, c_white, c_black, translate_get("Menu.CustomSound.Composer") + ": " + soundtrack_get_value(soundtrack_id, "author"));

draw_reset();

// Buttons
for (var i = 0; i < button_count; i++) {
	var button = buttons[i];
	var new_button_y = button_y + button_step_y * i;
	var alpha = tab == 1 ? 1 : 0.1;
	
	button.draw(button_x - button.width / 2, new_button_y + button.height / 2, alpha);
	button.is_enable_interaction = tab == 1;
}

// Line
draw_rectangle(line_x - line_width / 2, line_y + line_height / 2, line_x + line_width / 2, line_y - line_height / 2, false);

// Arrows
if (soundtrack_id > 0) {
	arrow_vertical.up.draw(arrow_x, arrow_y_up, 1, 0);
}

if (soundtrack_id < soundtrack_counts - 1) {
	arrow_vertical.down.draw(arrow_x, arrow_y_down, 1, 180);
}

arrow_horizontal.left.draw(arrow_x_left, arrow_y, 1, 90);
arrow_horizontal.right.draw(arrow_x_right, arrow_y, 1, 270);

draw_reset();