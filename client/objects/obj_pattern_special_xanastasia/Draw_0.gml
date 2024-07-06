if (instance_exists(obj_battle_border_anim)) exit;

var surface = battle_get_board_surface();
if (surface == undefined) exit;

surface_set_target(surface)
part_system_drawit(partice);
surface_reset_target();
