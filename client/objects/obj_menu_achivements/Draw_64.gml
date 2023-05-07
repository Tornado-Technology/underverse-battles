// GUI
var width = display_get_gui_width();
var height = display_get_gui_height();
// ###

if (!buttons_show) exit;

draw_reset();

// Surface
if (!surface_exists(surface)) { surface = surface_create(surface_size.x, surface_size.y); }

draw_reset();

// Arrows
var arror_sprite_width = sprite_get_width(spr_stat_arrow) / 2;
var arror_sprite_height = sprite_get_height(spr_stat_arrow) / 2;
var arror_position_x = width - 12;

if (shift > -25) {
	var arror_position_y = surface_cord.y + 12;
	
	draw_sprite(spr_stat_arrow, 0, arror_position_x, arror_position_y);
	
	if (point_in_rectangle_gui(arror_position_x - arror_sprite_width, arror_position_y - arror_sprite_height, arror_position_x + arror_sprite_width, arror_position_y + arror_sprite_height)) {
		if (mouse_check_button(mb_any)) {
			scroll_up();
		}
	}
}

if (shift < size * 60 - 200) {
	var arror_position_y = surface_cord.y + surface_size.y - 12;
	
	draw_sprite_ext(spr_stat_arrow, 0, arror_position_x, arror_position_y, 1, 1, 180, c_white, 1);
	
	if (point_in_rectangle_gui(arror_position_x - arror_sprite_width, arror_position_y - arror_sprite_height, arror_position_x + arror_sprite_width, arror_position_y + arror_sprite_height)) {
		if (mouse_check_button(mb_any)) {
			scroll_down();
		}
	}
}

// Surface target
surface_set_target(surface) {
draw_clear_alpha(c_white, 0);

#region Surface
for (var ach = 0; ach < size; ach++) {
	var achievement = global.__achievement_list[ach];
	var text_y = 60 * ach - shift;
	
	if (text_y - 20 > surface_size.y) continue;
	
	draw_sprite_ext(achievement.icon, 0, x + 48, text_y, 1, 1, 0, achievement.is_taken ? c_white : c_dkgray, 1);
	draw_set_color(c_white);
	draw_sprite_ext(spr_ui_achievement_border, achievement.is_taken ? 0 : 1, x, text_y, -1.5, 1, 0, c_white, 1);
	
	draw_set_font(global._font_main_determination);
	draw_set_halign(fa_left);
	
	draw_text(x + 50, text_y - 19, achievement.name);
	draw_text_ext(x + 50, text_y + 3, achievement.description, 12, 300);
}
#endregion

// Reset
draw_reset();

// Reset Target
} surface_reset_target();

// Draw surface
draw_surface(surface, surface_cord.x, surface_cord.y);

draw_reset();