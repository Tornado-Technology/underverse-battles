progress	  = 0;
progress_step = 35;
progress_max  = 1000;

if (animation_id == "Create") {
	battle_border_reset_postion(true, true);

	angle = battle_border_get_angle();
	angle = angle == 0 ? 360 : angle;

	dir[dir.up]    = battle_border_get_size("u");
	dir[dir.down]  = battle_border_get_size("d");
	dir[dir.left]  = battle_border_get_size("l");
	dir[dir.right] = battle_border_get_size("r");

	battle_border_set_angle(0);
	battle_border_set_size(0, 0, 0, 0);
}

if (animation_id == "Destroy") {
	battle_border_reset_postion(true, true);

	angle = battle_border_get_angle();
	angle = angle == 0 ? 360 : angle;

	dir[dir.up]    = battle_border_get_size("u");
	dir[dir.down]  = battle_border_get_size("d");
	dir[dir.left]  = battle_border_get_size("l");
	dir[dir.right] = battle_border_get_size("r");
}