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
		
draw_text_ext(
	dialog_window_position.x - dialog_window_size.x / 2 + text_indent,
	dialog_window_position.y + text_indent, 
	str, 
	16,
	dialog_window_size.x - text_indent * 2
);
    
// Speaker's frame
if (frame != noone) {
	draw_sprite(frame, 0, dialog_window_position.x - dialog_window_size.x / 2 - 60, dialog_window_position.y + 16);
}	

// Skip arrow
skip_arrow.draw(
	dialog_window_position.x + dialog_window_size.x / 2 - skip_arrow.width,
	dialog_window_position.y + dialog_window_size.y - skip_arrow.height,
	1,
	270
);