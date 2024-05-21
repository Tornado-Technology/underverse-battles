if (act < 1) exit;

// Reset
draw_reset();

// Position
dialog_window_position.y += side == dir.down ? shift : 0;

// Dialog window
if (is_showing_dialog_window) {
	draw_sprite_ext(dialog_window_sprite, 0, dialog_window_position.x, dialog_window_position.y, dialog_window_xscale, dialog_window_yscale, 0, c_white, 1);
}

// Main text
draw_set_font(font);
draw_set_halign(fa_left);
draw_set_colour(text_color);

draw_text_ext(dialog_window_position.x - dialog_window_size.x / 2 + text_indent, dialog_window_position.y + text_indent, str, 16, 300);

//Answer options
if (act == 2 && pos == string_length(cur_text)) {
	selector.draw(0, dialog_window_position.x - dialog_window_size.x / 4, dialog_window_position.y + dialog_window_size.y - text_indent);
	selector.draw(1, dialog_window_position.x + dialog_window_size.x / 4, dialog_window_position.y + dialog_window_size.y - text_indent);
}