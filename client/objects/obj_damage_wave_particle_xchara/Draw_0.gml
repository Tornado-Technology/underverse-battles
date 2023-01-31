if (instance_exists(obj_battle_border)) {
	surface_set_target(battle_get_board_surface()){
	    draw_self();
	}surface_reset_target();
}
draw_self();