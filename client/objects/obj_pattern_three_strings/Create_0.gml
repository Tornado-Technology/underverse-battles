// Arguments: bone, thread

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);
	
	create_error_string(-1, border_instance.y - border_instance.up + 2, thread, room_width + 1, border_instance.y - border_instance.up + 2, 3.4, fight_network_mode);
	create_error_string(-1, border_instance.y, thread, room_width + 1, border_instance.y, 3.4, fight_network_mode);
	create_error_string(-1, border_instance.y + border_instance.down - 2, thread, room_width + 1, border_instance.y + border_instance.down - 2, 3.4, fight_network_mode);
	
	time_source_start(time_source_delay);
}

var time_delay = 2;
time_source_delay = time_source_create(time_source_game, time_delay, time_source_units_seconds, function () {
	instance_create(obj_pattern_flying_bones, {
		border_instance: border_instance,
		_power: _power,
		bone: bone,
		sides: [dir.left, dir.right],
		is_aiming: true,
		final_function: destroy
	}).callback();
});

destroy = function () {
	instance_destroy(id);
}