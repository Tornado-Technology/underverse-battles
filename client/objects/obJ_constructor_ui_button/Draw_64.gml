if (!is_active || obj_menu.page_index != menu_page.main) exit;

draw_reset();

var is_hover = get_hover();
if (is_hover) {
	_hover_time = approach(_hover_time, _hover_time_limit, 1);
} else {
	_hover_time = approach(_hover_time, 0, 1);
}

var hover_merge = _hover_time / _hover_time_limit;
var new_color = merge_color(color, c_ltgray, hover_merge);
draw_set_color(new_color);

if (image == noone) {
	draw_roundrect(x, y, x + width, y + height, false);
} else {
	draw_sprite_ext(image, 0, x + get_width() / 2, y + get_height() / 2, scale_x, scale_y, 0, new_color, 1);
}

draw_reset();