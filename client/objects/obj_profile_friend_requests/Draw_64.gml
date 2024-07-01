if (!show)
	exit;
	
draw_reset();
draw_set_alpha(1);
draw_set_font(global._font_main_determination);
draw_set_halign(fa_center);
draw_set_color(c_white);

draw_text_outlined(line_x, line_y - line_height / 2 - 30 - wave(3, -3, 1, 0), c_white, c_black, title_text);

draw_reset();

/* Draw request name */
draw_name_button(request_text_x, request_text_y, text_color_standart, request_id);

for (var i = 1; i <= list_size - list_middle; i++) {
	if (request_id - i >= 0) {
		var color = i == list_size - list_middle ? text_color_last : text_color_standart;
		draw_name_button(request_text_x, request_text_y - button_step_y * i, color, request_id - i);
	}
	
	if (request_id + i < request_count) {
		var color = i == list_size - list_middle ? text_color_last : text_color_standart;
		draw_name_button(request_text_x, request_text_y + button_step_y * i, color, request_id + i);
	}
}

// Buttons
for (var i = 0; i < button_count; i++) {
	if (i != button_count - 1 && request_count == 0) continue;
	
	var button = buttons[i];
	var new_button_y = button_y + button_step_y * 2 + button_step_y * i;
	
	button.draw(button_x - button.width / 2, new_button_y + button.height / 2);
}

// Line
draw_rectangle(line_x - line_width / 2, line_y + line_height / 2, line_x + line_width / 2, line_y - line_height / 2, false);

// Arrows
if (request_id > 0) {
	arrow_vertical.up.draw(arrow_x, arrow_y_up, 1, 0);
}

if (request_id < request_count - 1) {
	arrow_vertical.down.draw(arrow_x, arrow_y_down, 1, 180);
}

draw_reset();