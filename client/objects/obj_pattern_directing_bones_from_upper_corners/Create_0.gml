// Arguments: bone, spining_bone

lower_bone_direction = fight_random_choose(dir.left, dir.right);

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 8, battle_soul_type.blue);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_lower_bone);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var random_x = fight_random_integer(-border_instance.left, border_instance.right);
	var angle_speed = 5;
	var bone_x = border_instance.x + random_x;
	var bone_y = border_instance.y - border_instance.up - 10;
	var bone_direction = point_direction(bone_x, bone_y, soul_instance.x, soul_instance.y);
	create_spinning_bone(bone_x, bone_y, spining_bone,
		3 + _power * 0.1, 1, bone_direction, 0, angle_speed);
}

update_lower_bone = function() {
	var bone_x = lower_bone_direction == dir.left ? border_instance.x + border_instance.right + 6 : border_instance.x - border_instance.left - 6;
	var bone_y = border_instance.y + border_instance.down;
	create_bone(bone_x, bone_y, bone, 1 + _power * 0.1, 1, lower_bone_direction, 0);
}

var period = 34 - 2 * _power;
var repeats = 10 + _power * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [], repeats - 1);

time_source_update_lower_bone = time_source_create(time_source_game, (100 - 5 * _power) / 60, time_source_units_seconds, function() {
	update_lower_bone();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function() {
	instance_destroy();
});