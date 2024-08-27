event_inherited();
can_move = true;
damage = get_char_damage(obj_character_sans);
speed_const = 0;
scale_const = 1;
scale_time = 0;

change_scale = function(scale, step) {
	scale_const = scale;
	scale_time = step;
}

is_shaking = false;
shake_power = 1;
shake_position_x = 0;
shake_position_y = 0;

time_source_shake_exists = false;
shake = function() {
	is_shaking = true;
	time_source_shake = time_source_create(time_source_game, 1/6, time_source_units_seconds, function () {
		is_shaking = false;
	});
	time_source_shake_exists = true;
	time_source_start(time_source_shake);
}