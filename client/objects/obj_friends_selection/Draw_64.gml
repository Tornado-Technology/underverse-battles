if (!show)
	exit;
	
draw_reset();
draw_set_alpha(1);
draw_set_font(global._font_main_determination);
draw_set_halign(fa_center);
draw_set_color(c_white);

draw_text_outlined(line_x, line_y - line_height / 2 - 30 - wave(3, -3, 1, 0), c_white, c_black, title_text);

draw_reset();

/* Draw friend name */
draw_name_button(friend_text_x, friend_text_y, text_color_standart, friend_id);

for (var i = 1; i <= list_size - list_middle; i++) {
	if (friend_id - i >= 0) {
		var color = i == list_size - list_middle ? text_color_last : text_color_standart;
		draw_name_button(friend_text_x, friend_text_y - button_step_y * i, color, friend_id - i);
	}
	
	if (friend_id + i < array_length(friends)) {
		var color = i == list_size - list_middle ? text_color_last : text_color_standart;
		draw_name_button(friend_text_x, friend_text_y + button_step_y * i, color, friend_id + i);
	}
}

// Buttons
for (var i = 0; i < button_count; i++) {
	var button = buttons[i];
	var new_button_y = button_y + button_step_y * i;
	
	button.draw(button_x - button.width / 2, new_button_y + button.height / 2);
}

// Line
draw_rectangle(line_x - line_width / 2, line_y + line_height / 2, line_x + line_width / 2, line_y - line_height / 2, false);

// Arrows
if (friend_id > 0) {
	arrow_vertical.up.draw(arrow_x, arrow_y_up, 1, 0);
}

if (friend_id < array_length(friends) - 1) {
	arrow_vertical.down.draw(arrow_x, arrow_y_down, 1, 180);
}

draw_reset();