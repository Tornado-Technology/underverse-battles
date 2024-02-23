event_inherited();

is_trap = false;
is_target = false;
is_swung = false;
is_moving_left = false;
is_moving_line = false;
stop_alpha = false;

step_alpha = 0.03;

stage = 0;
alpha = 0;
image_alpha = 0;
acc = 0;
max_acc = 0;

target_ = undefined;

trap = function () {
	is_trap = true;
	time_source_destroy_blades = time_source_create(time_source_game, time_destroy / 60, time_source_units_seconds, function () {
	 stop_alpha = true;
	})
}

move_left = function () {
	is_moving_left = true;
}

_target = function (target) {
	is_target = true;
	target_ = point_direction(x, y, target.x, target.y);	
}

swung = function (_max_acc) {
	max_acc = _max_acc;
	is_swung = true;
	
	time_source_move_start = time_source_create(time_source_game, 1/2, time_source_units_seconds, function () {
	audio_play_sound_plugging(snd_projectile);
	stage = 1;
	});

	time_source_move_next = time_source_create(time_source_game, (30 + max_acc) / 60, time_source_units_seconds, function () {
		stage = 2;
	});

	time_source_move_finish = time_source_create(time_source_game, (31 + 2 * max_acc) / 60, time_source_units_seconds, function () {
		stage = 3;
		stop_alpha = true;
	});

	time_source_start(time_source_move_start);
	time_source_start(time_source_move_next);
	time_source_start(time_source_move_finish);
}


move_line = function () {
	is_moving_line = true;
}