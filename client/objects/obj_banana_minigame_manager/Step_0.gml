btime = approach(btime, btime_max, dtime);
ctime = approach(ctime, ctime_max, dtime);

if (input_check_pressed(input.back)) room_goto(room_menu);

if (btime >= btime_max) {
	btime = 0;
	btime_max = irandom_range(60, 180);
	var new_x = 500;
	var new_y = irandom_range(60, 260);
	instance_create_depth(new_x, new_y, 0, obj_banana_minigame_banana);
}

if (ctime >= ctime_max) {
	ctime = 0;
	var new_x = 500;
	var new_y = irandom_range(60, 280);
	var dog_car_chance = bscore > 50 ? (bscore > 250 ? 2 : 1) : 0;
	var _inst = instance_create_depth(new_x, new_y, 0, choose_weighted(obj_banana_minigame_car, 20, obj_banana_minigame_car_mini, 12, obj_banana_minigame_car_dog, dog_car_chance));
	_inst.image_xscale = -1;
	_inst._speed = choose(5, 4, 3, 3, 2);
}

with (all) {
	depth = -bbox_bottom;
}
