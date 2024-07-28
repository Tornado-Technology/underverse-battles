disable_surface = true;

be_moving_circle = false;

turn_on = false;

stage = 0;
angle = 0;
acc = 0;
image_xscale = x > obj_battle_border.x ? 1: -1; 


spwan = function () {
	var drop_instance = [];
	var i = 0;
	repeat(3) {
		var angle_offset = image_angle - 180;
		var radius = sprite_width;
		var	spwan_x = dcos(angle_offset) * radius;
		var	spwan_y = -dsin(angle_offset) * radius;

		var drop = fight_random_choose(obj_drop_black_ink_sans, obj_drop_blue_ink_sans, obj_drop_green_ink_sans, obj_drop_ink_sans, obj_drop_orange_ink_sans);

		drop_instance[i] = create_drop(x + spwan_x, y + spwan_y, drop, speed_const + angle_speed_const,  x > obj_battle_border.x ? 180 : 0, false);
		drop_instance[i].disable_surface = true;
		i++;
	}
	drop_instance[0].direction += 15;
	drop_instance[2].direction -= 15;
}

// Time sources
time_source_move_start = time_source_create(time_source_game, 1/2, time_source_units_seconds, function () {
	audio_play_sound_plugging(snd_projectile);
	stage = 1;
});

time_source_move_next = time_source_create(time_source_game, (30 + max_acc) / 60, time_source_units_seconds, function () {
	stage = 2;
});

time_source_move_finish = time_source_create(time_source_game, (31 + 2 * max_acc) / 60, time_source_units_seconds, function () {
	stage = 3;
	spwan();
});

time_source_start(time_source_move_start);
time_source_start(time_source_move_next);
time_source_start(time_source_move_finish);