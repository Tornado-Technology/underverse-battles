// Reset
draw_reset();

// Position
dialog_window_position.y += side == dir.down ? shift : 0;

// Dialog window
if (is_showing_dialog_window) {
	draw_sprite_ext(dialog_window_sprite, 0, dialog_window_position.x, dialog_window_position.y, dialog_window_xscale, dialog_window_yscale, 0, c_white, 1);
}

// Main text
ui.draw(dialog_window_position.x - dialog_window_size.x / 2 + text_indent, dialog_window_position.y + text_indent, text_color, font);

//Answer options
var arrow_position = new Vector2(dialog_window_position.x + dialog_window_size.x / 2 - skip_arrow.width, dialog_window_position.y + dialog_window_size.y - skip_arrow.height);
if (ui.is_flipping()) {
	skip_arrow.draw(arrow_position.x, arrow_position.y, 1, 270);
}
else {
	selector.draw(0, dialog_window_position.x - dialog_window_size.x / 4, dialog_window_position.y + dialog_window_size.y - text_indent);
	selector.draw(1, dialog_window_position.x + dialog_window_size.x / 4, dialog_window_position.y + dialog_window_size.y - text_indent);
}