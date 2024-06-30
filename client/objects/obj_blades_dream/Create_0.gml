event_inherited();

is_directions = false;
is_target = false;
is_swung = false;
is_spinning = false;

stop_alpha = false;

step_alpha = 0.03;
speed_spinning = 0;

stage = 0;
alpha = 0;
image_alpha = alpha;
acc = 0;
max_acc = 0;

border = obj_battle_border;
rotational = false;
on_target = 0

move_back = function() {
	step = 0;
	
	if (direction == 0) {
		point_stop_x = border.x - border.left - 20;
		direction = 180;
	}
	else if (direction == 180) {
		point_stop_x = border.x + border.right + 20;
		direction = 0;
	}
	
	if (direction == 270) {
		point_stop_y = border.y - border.up - 20;
		direction = 90;
	}
	else if (direction == 90) {
		point_stop_y = border.y + border.down + 20;
		direction = 270;
	}
	
	audio_play_sound_plugging(snd_projectile);
}

directions = function () {
	is_directions = true;
	time_source_destroy_blades = time_source_create(time_source_game, time_destroy / 60, time_source_units_seconds, function () {
	 stop_alpha = true;
	})
};

target = function (_target) {
	is_target = true;
	on_target = point_direction(x, y, _target.x, _target.y);	
	
};

swung = function (_max_acc) {
	max_acc = _max_acc;
	is_swung = true;
	
	time_source_move_start = time_source_create(time_source_game, 1 / 2, time_source_units_seconds, function () {
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
};



move_spinning = function (spd) {
	is_spinning = true;	
	speed_spinning = spd;
};

on_soul_touch = function () {
	if(image_alpha >= 0.8) {
		fight_soul_damage(damage, destructible, id);
	};	
	
}