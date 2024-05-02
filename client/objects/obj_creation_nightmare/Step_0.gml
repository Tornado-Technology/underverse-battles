x = approach(x, target_position.x, speed_coust * dtime);
y = approach(y, target_position.y, speed_coust * dtime);

if (image_alpha <= 1) {
	image_alpha += 0.1	
}

if (x == target_position.x && y == target_position.y) {
	bonb();
}


image_xscale = x > obj_battle_soul.x ? -1 : 1;


