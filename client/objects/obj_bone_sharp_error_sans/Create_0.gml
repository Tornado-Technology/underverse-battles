event_inherited();

damage = get_char_damage(obj_character_error_sans);

hspd_inert = 0;

is_falling = false;
is_moving_back = false;
acceleration = 0;
speed_max = 4;

time_source_fall_exists = false;
time_source_move_back_exists = false;

set_fall = function (_scale, _acceleration) {
	audio_play_sound_plugging(snd_emergence);
	scale_const = _scale;
	scale_time = 0.1;
	acceleration = _acceleration;
	time_source_fall = time_source_create(time_source_game, 1/6, time_source_units_seconds, function () {
		audio_play_sound_plugging(snd_projectile);
		is_falling = true;
	});
	time_source_fall_exists = true;
	time_source_start(time_source_fall);
}

can_stuck = false;
stuck = function () {
	can_stuck = true;
}

set_move_back = function () {
	is_moving_back = true;
	time_source_move_back = time_source_create(time_source_game, 1/6, time_source_units_seconds, function () {
		speed_const = 3;
		direction -= 180;
		is_moving_back = false;
	});
	time_source_move_back_exists = true;
}