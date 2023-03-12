time++;

if (time % 5 == 0 and time < final_time) {
	var inst_speed = 2;
	var inst_drop = choose(obj_drop_ink_sans, obj_drop_ink_sans,
							obj_drop_orange_ink_sans,
							obj_drop_black_ink_sans);
	var inst_speed = 2;
	instance_create_depth(x, y, fight_depth.bullet_outside_hight, inst_drop, {
		speed: inst_speed,
		direction: random_range(0, 360),
		image_angle: direction + 90
	});
}