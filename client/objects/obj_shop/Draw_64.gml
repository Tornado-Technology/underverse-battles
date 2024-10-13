// Reset
draw_reset();

draw_set_color(c_white);

// Shop windows
var dividing_line_position_up = new Vector2(gui_position.right_up.x * 2 / 3, gui_position.right_up.y);
var dividing_line_position_down = new Vector2(gui_position.right_down.x * 2 / 3, gui_position.right_down.y);
var sprite_border_width = sprite_get_width(border_sprite);
var sprite_border_height = sprite_get_height(border_sprite);
draw_sprite_ext(border_sprite, 0,
	gui_position.left_up.x, gui_position.left_up.y,
	dividing_line_position_down.x / sprite_border_width, (dividing_line_position_down.y - gui_position.left_up.y) / sprite_border_height,
	0, c_white, 1
);
draw_sprite_ext(border_sprite, 0,
	dividing_line_position_up.x, dividing_line_position_up.y,
	(gui_position.right_down.x - dividing_line_position_up.x) / sprite_border_width, (gui_position.right_down.y - dividing_line_position_up.y) / sprite_border_height,
	0, c_white, 1
);

// Menu buttons
switch (ui.tab) {
	case 0:
		ui.draw_buttons(dividing_line_position_up.x + padding, dividing_line_position_up.y + padding, padding);
		break;
	case 1:
	case 3:
		ui.draw_buttons(gui_position.left_up.x + padding, gui_position.left_up.y + padding, padding);
		break;
}

// Monolog
var text_position = new Vector2(gui_position.left_up.x + text_indent, gui_position.left_up.y + text_indent);
var w = dividing_line_position_up.x - gui_position.left_up.x - text_indent * 2;
if (ui.tab == 1 || ui.tab == 3) {
	text_position = new Vector2(dividing_line_position_up.x + text_indent, dividing_line_position_up.y + text_indent);
	w = gui_position.right_up.x - dividing_line_position_up.x - text_indent * 2;
}

ui.draw_dialog(text_position.x, text_position.y, 16, w);

// Money and item count
if (instance_exists(obj_inventory)) {
	draw_set_font(global._font_main_determination);
	draw_set_halign(fa_left);
	draw_text(dividing_line_position_up.x + padding + shift_for_money_counter, dividing_line_position_up.y + padding * 5, $"{obj_inventory.money}G");
	draw_set_halign(fa_right);
	draw_text(gui_position.right_down.x - padding + shift_for_item_counter, dividing_line_position_up.y + padding * 5, $"{obj_inventory.ui.item_count}/{obj_inventory.max_item_count}");
}

// Skip arrow
if (ui.tab == 0 || ui.tab == 1 || ui.tab == 3) exit;

var arrow_position = new Vector2(dividing_line_position_down.x - skip_arrow.width - 5, dividing_line_position_down.y - skip_arrow.height - 5);
if (ui.dialog.is_flipping()) {
	skip_arrow.draw(arrow_position.x, arrow_position.y, 1, 270);
}
else {
	next_arrow.draw(arrow_position.x, arrow_position.y, 1, 270);
}