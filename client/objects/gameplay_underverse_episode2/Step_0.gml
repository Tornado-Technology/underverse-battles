if (global.fight_instance != noone && fight_position_event) {
	error_sans.x = lerp(error_sans.x, global.fight_instance.center_player_position_x[0], 0.1);
	ink_sans.x = lerp(ink_sans.x, global.fight_instance.center_player_position_x[1], 0.1);
	ink_sans.image_xscale = -1;
}