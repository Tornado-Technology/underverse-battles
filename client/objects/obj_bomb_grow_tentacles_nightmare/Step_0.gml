if (image_alpha != 1) {
	image_alpha += 0.1;
}

if (move_up_down) {
	var border = obj_battle_border;

	motion_set(direction, speed_const * dtime);
	
	if (y < border.y - border.up) {
		direction = 270;
	}
	else if (y > border.y + border.down) {
		direction = 90;	
	};
	
	image_angle++;
}