draw_reset();
draw_set_font(global._font_main_determination);

if (!show)
	exit;
	
draw_reset();
draw_set_alpha(1);
draw_set_font(global._font_main_determination);
draw_set_halign(fa_center);
draw_set_color(c_white);

var custom = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.BACKGROUND_CUSTOM);
var _string = background_get(background_info.name, custom);
draw_text_outlined(line_x, line_y - line_height / 2 - 30 - wave(3, -3, 1, 0), c_white, c_black, translate_get("Menu.Background.SelectedLocation") + _string);

draw_reset();

/* Draw soundtrack */
draw_name_button(background_x, background_y, text_color_standart, background_id);

for (var i = 1; i <= list_size - list_middle; i++) {
	if (background_id - i >= 0) {
		var color = i == list_size - list_middle ? text_color_last : text_color_standart;
		draw_name_button(background_x, background_y - button_step_y * i, color, background_id - i);
	}
	
	if (background_id + i < background_counts) {
		var color = i == list_size - list_middle ? text_color_last : text_color_standart;
		draw_name_button(background_x, background_y + button_step_y * i, color, background_id + i);
	}
}

// Buttons
for (var i = 0; i < button_count; i++) {
	var button = buttons[i];
	var new_button_y = button_y + button_step_y * 2 + button_step_y * i;
	
	button.draw(button_x - button.width / 2, new_button_y + button.height / 2);
}

// Line
draw_rectangle(line_x - line_width / 2, line_y + line_height / 2, line_x + line_width / 2, line_y - line_height / 2, false);

// Arrows
if (background_id > 0) {
	arrow_vertical.up.draw(arrow_x, arrow_y_up, 1, 0);
}

if (background_id < background_counts - 1) {
	arrow_vertical.down.draw(arrow_x, arrow_y_down, 1, 180);
}

// Background
var scale_size = 0.25;
var bg_sprite = background_get(background_info.sprite, background_id);
var border_scale_x = ((sprite_get_width(bg_sprite))  * scale_size + 14) / sprite_get_width(spr_bg_border);
var border_scale_y = ((sprite_get_height(bg_sprite)) * scale_size + 14) / sprite_get_height(spr_bg_border);
draw_sprite_ext(bg_sprite,     0, 50,     85,     scale_size,     scale_size,     0, c_white, 1);
draw_sprite_ext(spr_bg_border, 0, 50 - 7, 85 - 7, border_scale_x, border_scale_y, 0, c_white, 1);

draw_reset();