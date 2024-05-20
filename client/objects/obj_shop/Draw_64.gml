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
switch (tab) {
	case 0:
		var i = 0;
		repeat(menu_button_count) {
			buttons[i].draw(dividing_line_position_up.x + padding, dividing_line_position_up.y + padding * (i + 1));
			i++;
		}
		break;
	case 1:
		var i = 0;
		repeat(array_length(item_buttons)) {
			item_buttons[i].draw(gui_position.left_up.x + padding, gui_position.left_up.y + padding * (i + 1));
			i++;
		}
		break;
	case 3:
		var i = 0;
		repeat(array_length(talk_buttons)) {
			talk_buttons[i].draw(gui_position.left_up.x + padding, gui_position.left_up.y + padding * (i + 1));
			i++;
		}
		break;
}

if (act < 1) exit;

// Monolog
draw_set_font(font);
draw_set_halign(fa_left);
draw_set_colour(text_color);

var text_position = new Vector2(gui_position.left_up.x + text_indent, gui_position.left_up.y + text_indent);
var w = gui_position.right_up.x - gui_position.left_up.x - text_indent * 2;
if (tab == 1 || tab == 3) {
	text_position = new Vector2(dividing_line_position_up.x + text_indent, dividing_line_position_up.y + text_indent);
	w = dividing_line_position_up.x - gui_position.left_up.x - text_indent * 2;
}

draw_text_ext(text_position.x, text_position.y, str, 16, w);

// Money
draw_set_halign(fa_left);
draw_text(dividing_line_position_up.x + padding, dividing_line_position_up.y + padding * 5, "0G");
draw_set_halign(fa_right);
draw_text(gui_position.right_down.x - padding, dividing_line_position_up.y + padding * 5, "0/0");

// Skip arrow
if ((tab == 0 || tab == 1 || tab == 3) && cur_num >= str_num - 1) exit;

skip_arrow.draw(dividing_line_position_down.x - skip_arrow.width - 5, dividing_line_position_down.y - skip_arrow.height - 5, 1, 270);