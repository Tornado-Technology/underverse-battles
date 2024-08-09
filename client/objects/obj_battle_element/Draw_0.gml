if (variable_instance_exists(id, "disable_surface")) {
	if (disable_surface) {
		draw_self();
		exit;
	};
};

if (instance_exists(obj_battle_border_anim)) exit;

var surface = battle_get_board_surface();
if (surface == undefined) exit;

surface_set_target(surface)
draw_self();
surface_reset_target();