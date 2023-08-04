// Arguments: bone

main_speed = 1 + _power * 0.2;

platform_scale = 10;
platform_distance = 200;
platform_count = 2;
		
callback = function () {
	instance_create(obj_pattern_falling_bones, {
		border_instance: border_instance,
		_power: _power,
		bone: bone,
		sides: [dir.up, dir.down],
		final_function: destroy
	}).callback();
	
	create_moving_platforms(border_instance.x - border_instance.left - 40, border_instance.y - 20, platform_count, platform_scale, platform_distance, main_speed);
	create_moving_platforms(border_instance.x + border_instance.right + 40, border_instance.y + 20, platform_count, platform_scale, platform_distance, -main_speed);
	
	time_source_start(time_source_update_platforms);
}

update_platforms = function() {
	create_next_moving_platform(border_instance.x - border_instance.left - 40, border_instance.y - 20, platform_count, platform_scale, platform_distance, main_speed);
	create_next_moving_platform(border_instance.x + border_instance.right + 40, border_instance.y + 20, platform_count, platform_scale, platform_distance, -main_speed);
}

destroy = function() {
	instance_destroy(id);
}
	
time_source_update_platforms = time_source_create(time_source_game, 1 / main_speed, time_source_units_seconds, function () {
	update_platforms();
}, [], -1);