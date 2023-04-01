if (can_move) {
	motion_set(_angle, const_speed * dtime);
}

if	(x > obj_battle_border.x + obj_battle_border.right + 5  * image_xscale && speed > 0) or
	(x < obj_battle_border.x - obj_battle_border.left - 5  * image_xscale && speed < 0) {
	instance_destroy();
	}