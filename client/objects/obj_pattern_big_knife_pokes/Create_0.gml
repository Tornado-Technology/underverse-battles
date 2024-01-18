// Arguments: big_knife, bone

callback = function () {
	instance_create(obj_pattern_row_of_bones, {
		border_instance: border_instance,
		_power: _power,
		bone: bone,
		final_function: destroy
	}).callback();
	
	knife_instance = create_big_knife_y(border_instance.x, border_instance.y - border_instance.up - 30, big_knife, 270, 270, border_instance.y + border_instance.down - 20, fight_network_mode);
		
	time_source_start(time_source_update);
}

update = function() {
	set_big_knife_move(knife_instance, 3 + _power * 0.2, fight_network_mode);
	set_big_knife_move_up(knife_instance, fight_network_mode);
}

destroy = function () {
	instance_destroy(id);
}

time_source_update = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
	update();
});