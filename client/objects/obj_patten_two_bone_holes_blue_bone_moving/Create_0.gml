// Arguments: bone, blue_bone

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 5, battle_soul_type.blue);

	update_two_bone();

	time_source_start(time_source_update_two_bone);
	time_source_start(time_source_destroy_update);
}

update_two_bone = function () {
	var speed_bone = 2.5 + _power * 0.2;
	var bone_direction = fight_random_choose(dir.left, dir.right);
	var bone_x = bone_direction == dir.right ? border_instance.x - border_instance.left - 10 : border_instance.x + border_instance.right + 10;
	var bone_y_top = border_instance.y - border_instance.up - 5;
	var bone_y_bottom = border_instance.y + border_instance.down + 5;	
	
	if (fight_random_integer(0, 1)) {
		var size_bone_top = 2.8 + _power * 0.05;
		var size_bone_bottom = 4 - size_bone_top - fight_random_float(0, 0.4);
		create_bone(bone_x, bone_y_top, bone, speed_bone, size_bone_top, bone_direction, 180);
		create_bone(bone_x, bone_y_bottom, bone, speed_bone, size_bone_bottom, bone_direction, 0);
	} else {
		create_bone(bone_x, bone_y_bottom, blue_bone, speed_bone, 4, bone_direction, 0);
	}
}

var period = 45 - _power;
var repeats = 8 + _power * 2;

time_source_update_two_bone = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_two_bone();
}, [], repeats - 1);

time_source_destroy_update = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();	
});
