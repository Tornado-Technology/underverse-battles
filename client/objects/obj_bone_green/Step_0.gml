if (place_meeting(x, y, obj_platform)) {
	plat = instance_place(x, y, obj_platform);
	hspd_inert = plat._speed;
	if (image_angle == 0)
		if (plat.y > y - 20)
			can_move = false;
	if (image_angle == 180)
		if (plat.y < y + 20)
			can_move = false;
}

x += hspd_inert;