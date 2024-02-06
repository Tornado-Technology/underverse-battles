// Arguments: bone, thread

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + 10, battle_soul_type.red);
	
	create_error_string(-1, border_instance.y - border_instance.up + 2, thread, room_width + 1, border_instance.y - border_instance.up + 2, 3.4 + _power * 0.1);
	create_error_string(-1, -1, thread, room_width + 1, room_height + 1, 3.4 + _power * 0.1);
	create_error_string(-1, border_instance.y + border_instance.down - 2, thread, room_width + 1, border_instance.y + border_instance.down - 2, 3.4 + _power * 0.1);
	
	time_source_start(time_source_delay);
}

var time_delay = 2;
time_source_delay = time_source_create(time_source_game, time_delay, time_source_units_seconds, function () {
	instance_create(obj_pattern_flying_bones, {
		border_instance: border_instance,
		_power: _power,
		bone: bone,
		sides: [dir.down, dir.up],
		is_aiming: false,
		final_function: destroy
	}).callback();
});

destroy = function () {
	instance_destroy(id);
}