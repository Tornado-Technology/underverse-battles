// Arguments: bone

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
		
	update_bone();
	time_source_start(time_source_update_bone);
	time_source_start(time_source_update_platforms);
	time_source_start(time_source_update_destroy);
}

update_bone = function() {
	position += fight_random_integer(1, max_position - 1);
	if (position >= max_position) {
		position -= max_position;
	}
	
	var sector_y = border_instance.y - border_instance.up + 25;
	
	var speed_bone = 2 + _power * 0.1
	var direction_bone = choose(border_instance.x + border_instance.right, border_instance.x - border_instance.left) == border_instance.x + border_instance.right  ? border_instance.x + border_instance.right : border_instance.x - border_instance.left;
	var angle_bone = direction_bone == border_instance.x + border_instance.right  ? 180 : 0;
	
	switch (position) {
		case 0:
			create_bone(direction_bone, sector_y - 5, obj_bone_spinning_papyrus, speed_bone,  1, angle_bone, angle_bone);
			break;
		case 1:
			create_bone(direction_bone, sector_y + sector_y_step - 5, obj_bone_spinning_papyrus, speed_bone, 1, angle_bone, angle_bone);
			break;
		case 2:
			create_bone(direction_bone, sector_y + sector_y_step * 2 - 5, obj_bone_spinning_papyrus, speed_bone,  1, angle_bone, angle_bone);
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
time_source_update_bone = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_bone();
}, [], repeats - 1);
	
time_source_update_platforms = time_source_create(time_source_game, 1 / platforms_speed, time_source_units_seconds, function () {
	update_platforms();
}, [], -1);
		
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});