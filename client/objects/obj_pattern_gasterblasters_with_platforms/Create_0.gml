// Arguments: bone, gasterblaster

max_position = 3;
position = fight_random_integer(0, max_position - 1);

platforms_speed = 0.5 + _power * 0.1;
sector_y_step = 35;

callback = function () {
	var sector_y = border_instance.y - border_instance.up + 25;
	
	create_moving_platforms(border_instance.x - border_instance.left - 40, sector_y, 4, 6, 60, platforms_speed);
	create_moving_platforms(border_instance.x + border_instance.right + 40, sector_y + sector_y_step, 4, 6, 60, -platforms_speed);
	create_moving_platforms(border_instance.x - border_instance.left - 40,  sector_y + sector_y_step * 2, 4, 6, 60, platforms_speed);
		
	var soul_offset = 5;
	var soul_position = fight_random_choose(new Vector2(border_instance.x - 38, sector_y - soul_offset), new Vector2(border_instance.x + 12, sector_y + sector_y_step - soul_offset), new Vector2(border_instance.x - 38, sector_y + sector_y_step * 2 - soul_offset));
	soul_instance = create_soul(soul_position.x, soul_position.y, battle_soul_type.blue);
	
	var i = 0; repeat(20) {
		create_bone(border_instance.x - border_instance.left + i * 8, border_instance.y + border_instance.down + 3, bone, 0, 1, 0, 0);
		i++;
	}
		
	update_gasterblasters();
	time_source_start(time_source_update_gasterblasters);
	time_source_start(time_source_update_platforms);
	time_source_start(time_source_update_destroy);
}

update_gasterblasters = function() {
	position += fight_random_integer(1, max_position - 1);
	if (position >= max_position) {
		position -= max_position;
	}
	var border_distance = obj_camera.view_width + object_get_sprite_max_size(gasterblaster);
	var final_position_x = border_instance.x + border_instance.right + 25;
	var sector_y = border_instance.y - border_instance.up + 25;
	switch (position) {
		case 0:
			create_gasterblaster(gasterblaster, border_distance, sector_y - 5, final_position_x, sector_y - 5,  270, 1/8, 1 - _power * 0.1, 15/60, 1/6);
			break;
		case 1:
			create_gasterblaster(gasterblaster, border_distance, sector_y + sector_y_step - 5, final_position_x, sector_y + sector_y_step - 5,  270, 1/8, 1 - _power * 0.1, 15/60, 1/6);
			break;
		case 2:
			create_gasterblaster(gasterblaster, border_distance, sector_y + sector_y_step * 2 - 5, final_position_x, sector_y + sector_y_step * 2 - 5,  270, 1/8, 1 - _power * 0.1, 15/60, 1/6);
			break;
	}
}
	
update_platforms = function() {
	var sector_y = border_instance.y - border_instance.up + 25;
	create_next_moving_platform(border_instance.x - border_instance.left - 40, sector_y, 4, 6, 60, platforms_speed);
	create_next_moving_platform(border_instance.x + border_instance.right + 40, sector_y + sector_y_step, 4, 6, 60, -platforms_speed);
	create_next_moving_platform(border_instance.x - border_instance.left - 40,  sector_y + sector_y_step * 2, 4, 6, 60, platforms_speed);
}

var period = 65 - _power * 6;
var repeats = 5 + _power;
time_source_update_gasterblasters = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_gasterblasters();
}, [], repeats - 1);
	
time_source_update_platforms = time_source_create(time_source_game, 1 / platforms_speed, time_source_units_seconds, function () {
	update_platforms();
}, [], -1);
		
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});