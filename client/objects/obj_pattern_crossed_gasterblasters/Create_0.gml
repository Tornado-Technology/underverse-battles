// Arguments: gasterblaster

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function(pow) {
	var gasterblaster_size = object_get_sprite_max_size(gasterblaster);
	var position = Vector2.zero();
	var min_position = new Vector2(-gasterblaster_size, -gasterblaster_size);
	var max_position = new Vector2(
		obj_camera.view_width + gasterblaster_size,
		obj_camera.view_height + gasterblaster_size
	);
	
	var random_index = fight_random_choose(0, 3);
	repeat (2) {
		switch (random_index) {
			case 0:
				position.x = min_position.x;
				position.y = fight_random_integer(min_position.y, max_position.y);
				break;
		
			case 1:
				position.x = fight_random_integer(min_position.x, max_position.x);
				position.y = max_position.y;
				break;
		
			case 2:
				position.x = max_position.x;
				position.y = fight_random_integer(min_position.y, max_position.y);
				break;
		
			case 3:
				position.x = fight_random_integer(min_position.x, max_position.x);
				position.y = min_position.y;
				break;
		}
		var target_distance = 60;
		var gasterblaster_direction = point_direction(position.x, position.y, border_instance.x, border_instance.y);
		var final_position_x = border_instance.x - target_distance * dcos(gasterblaster_direction);
		var final_position_y = border_instance.y + target_distance * dsin(gasterblaster_direction);
		
		create_gasterblaster(gasterblaster, position.x, position.y, final_position_x, final_position_y, gasterblaster_direction + 90, 1/6, 1 - _power * 0.1,  15/60, 1/6);
		random_index = (random_index + 1) % 4;
	}
}

var period = 65 - _power * 6;
var repeats = 5 + _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
		
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});