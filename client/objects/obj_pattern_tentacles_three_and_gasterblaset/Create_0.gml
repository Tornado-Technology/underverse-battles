// Arguments: gasterblaster_aiming, thread_tentacles
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);
	
	time_source_start(time_source_update);
	time_source_start(time_source_update_stop);
}

update = function () {
	
	var coord = [];
	coord = rand_side_from(-1, -1, room_width + 1, room_height + 1);
	
	var thread_tentacles_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, thread_tentacles);
	thread_tentacles.x_dir = soul_instance.x;
	thread_tentacles.y_dir = soul_instance.y;
	thread_tentacles.scale_speed = 2 + _power * 0.1;
	
}

update_gasterblaster = function () {
	var period = 50 - _power * 5;
	var gb_size = 60;
	var con = room_height + gb_size;
	var coord = rand_side_from(-gb_size, -gb_size, con, con);
	gasterblaster_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, gasterblaster_aiming, {
		target_time: (period - 12) / 60,
		charge_time: (period - 10) / 60,
		fly_time : 1 / 2,
		destroy_time: 15 / 60
	});
	
	var coord_new = rand_side_from(border_instance.x - border_instance.left, border_instance.y - border_instance.up, border_instance.x + border_instance.right, border_instance.y + border_instance.down);
	gasterblaster_instance.x_dir = coord_new[0];
	gasterblaster_instance.y_dir = coord_new[1];
	gasterblaster_instance.soul_invulnerability = 30;
	gasterblaster_instance.target = soul_instance;
}

var period = 30 - 2 * _power;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
},[], -1);

time_source_update_gasterblaster = time_source_create(time_source_game, _power / 60, time_source_units_seconds, function () {
	update_gasterblaster();	
})

time_source_update_stop = time_source_create(time_source_game, 5, time_source_units_seconds, function () {
	if (!soul_instance.is_stunned) {
		instance_destroy();
	}
	else {
		time_source_start(time_source_update_gasterblaster);
		time_source_start(time_source_update_destroy);
	}
});

var repeats = 5 + _power;

time_source_update_destroy = time_source_create(time_source_game, repeats * 1 / 6 + 1, time_source_units_seconds, function () {
	instance_destroy();	
})