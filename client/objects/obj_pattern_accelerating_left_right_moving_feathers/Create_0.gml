// Arguments: feathers

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var position_x = fight_random_choose(border_instance.x - border_instance.left - 20, border_instance.x + border_instance.y + 20);
	var random_position_y = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
	var position_y = fight_random_choose(border_instance.y + border_instance.down, random_position_y, random_position_y);
	
	instance_create_depth(position_x, position_y, 0, feathers, {
		_target_angle: point_direction(position_x, position_y, soul_instance.x, position_y)
	});
}

time_source_update = time_source_create(time_source_game, (22 - _power * 2) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {
	instance_destroy();
});