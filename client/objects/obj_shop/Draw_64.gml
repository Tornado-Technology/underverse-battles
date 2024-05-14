draw_set_color(c_white);

// Main rectangle
draw_line_width(gui_position.left_up.x, gui_position.left_up.y, gui_position.left_down.x, gui_position.left_down.y, line_thickness);
draw_line_width(gui_position.left_down.x, gui_position.left_down.y, gui_position.right_down.x, gui_position.right_down.y, line_thickness);
draw_line_width(gui_position.right_down.x, gui_position.right_down.y, gui_position.right_up.x, gui_position.right_up.y, line_thickness);
draw_line_width(gui_position.right_up.x, gui_position.right_up.y, gui_position.left_up.x, gui_position.left_up.y, line_thickness);

// Dividing line
var dividing_line_fraction = 2 / 3;
draw_line_width(gui_position.right_down.x * dividing_line_fraction, gui_position.right_down.y, gui_position.right_up.x * dividing_line_fraction, gui_position.right_up.y, line_thickness);

draw_set_font(global._font_main_determination);

// Menu buttons
switch (tab) {
	case 0:
		var i = 1;
		repeat(menu_button_count) {
			buttons[i].draw(gui_position.right_down.x * dividing_line_fraction + 15, gui_position.right_down.y + 15 * i);
			i++;
		}
		break;
}