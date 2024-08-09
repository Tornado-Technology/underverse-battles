
if (instance_exists(obj_battle_border_anim)) exit;

var surface = battle_get_board_surface();
if (surface == undefined) exit;

surface_set_target(surface)

if(!destroying) {
draw_self();
} else {
	draw_reset();
	draw_set_alpha(alpha);
	draw_circle(x, y, radius, false);
	draw_reset();
};
surface_reset_target();

if (variable_instance_exists(id, "disable_surface")) {
	if (disable_surface) {
		if(!destroying) {
			draw_self();
		} else {
			draw_reset();
			draw_set_alpha(alpha);
			draw_circle(x, y, radius, false);
			draw_reset();
		};	
	};
};