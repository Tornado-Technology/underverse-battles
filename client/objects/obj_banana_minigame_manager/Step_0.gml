btime = approach(btime, btime_max, 1);
ctime = approach(ctime, ctime_max, 1);

if (input_check_pressed(input.back)) room_goto(room_menu);

if (btime >= btime_max) {
	btime = 0;
	var new_x = 500;
	var new_y = irandom_range(250, 40);
	instance_create_depth(new_x, new_y, 0, obj_banana_minigame_banana);
}

if (ctime >= ctime_max) {
	ctime = 0;
	var new_x = 500;
	var new_y = irandom_range(250, 40);
	var _inst = instance_create_depth(new_x, new_y, 0, obj_banana_minigame_car);
	_inst.image_xscale = -1;
	_inst._speed = choose(5, 4, 3, 3, 2);
}

with (obj_banana_minigame_banana) {
	x -= other.bspeed;
	
	if (x < -48) {
		instance_destroy();
	}
}

with (obj_banana_minigame_car) {
	if (!is_crush) {
	
		x -= _speed;
	
		if (x < -48) {
			instance_destroy();
		}
	}
}

with (all) {
	depth = -bbox_bottom;
}