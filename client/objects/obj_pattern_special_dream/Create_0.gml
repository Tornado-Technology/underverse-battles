// Arguments: bomb,  spike

	
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	var offet = fight_random_integer(30, 80);
	var _xx = fight_random_choose(border_instance.x - border_instance.left - offet, border_instance.x + border_instance.right + offet);
	var _yy = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
	
	instance_create_depth(_xx, _yy, fight_depth.bullet_outside, bow, {
		target_time: 1,
		shot_time: 0.7,
		destroy_time: 0.1,
		_power: _power,
		arrows: arrows,
		speed_const: 3
	});		

	time_source_out_timer =  time_source_create(time_source_game, 39 / 60, time_source_units_seconds, function () {
			time_source_start(time_source_update);
	});

	
	if(fight_random_integer(0, 1)) {
		update_spwan_star();
	} else {
		update_star_rod();
	};
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};


update_star_rod = function () {
	var coord = [];
	var staff;
	var offset = 69;
	
	coord = rand_side_from(border_instance.x - border_instance.left - offset, border_instance.y - border_instance.up - offset, border_instance.x + border_instance.right + offset, border_instance.y + border_instance.down + offset);
	staff = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, obj_star_rod_dream, {
		image_angle: point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y) + 225,
		side: -1,
		angle_speed_const: -1,
		max_acc: 13,
		target: soul_instance,
		_power: 1
	});
	
}


update_spwan_star = function () {
	var offset = 30;
	var star_position;
	var	star_instance;
	repeat (3) {
		star_position = rand_side_from(border_instance.x - border_instance.left - offset, border_instance.y - border_instance.up - offset, border_instance.x + border_instance.right + offset, border_instance.y + border_instance.down + offset);	
		
		star_instance = instance_create_depth(star_position[0],  star_position[1], fight_depth.bullet_outside, star);
		star_instance.speed_const = 2.4 + _power * 0.2;
		star_instance.direction = point_direction(star_instance.x, star_instance.y, soul_instance.x, soul_instance.y);
		star_instance.disable_surface = true;
		star_instance.gradually_appearing();
	};
	
	audio_play_sound_plugging(snd_projectile);
}

 
var period = 90;
var repeats = 5 + (_power * 2);


time_source_update = time_source_create(time_source_game, 35 / 60, time_source_units_seconds, function () {
	if(fight_random_integer(0, 1)) {
		update_spwan_star();
	} else {
		update_star_rod();
	};
		
		time_source_start(time_source_out_timer);
});



time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});