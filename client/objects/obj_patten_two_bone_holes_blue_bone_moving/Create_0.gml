
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 5, battle_soul_type.blue);

	update_two_bone();

	time_source_start(time_source_update_two_bone);
	time_source_start(time_source_destroy_update);
}



update_two_bone = function () {
		var speed_bone = 3 + _power * 0.1;
	if (fight_random_integer(0, 1)) {
		var size_bone_main = border_instance._frame_right_height;
		var bone_main_y = border_instance.y - border_instance.up;
		var bone_main_x = border_instance.x + border_instance.right + 20;	
		var bone_y = border_instance.y + border_instance.down;
	
		size_bone_main -= 8 - (_power + 1);	

		size_bone_main /= fight_random_float(28 - _power + 1, 29);
		var size_bone = size_bone_main /fight_random_float(4, 6);
		
		var direction_bone = point_direction(bone_main_x, bone_main_y, border_instance.x, bone_main_y);
		create_bone(bone_main_x, bone_main_y, bone, speed_bone, size_bone_main, direction_bone, 180);
		create_bone(bone_main_x, bone_y, bone, speed_bone, size_bone, direction_bone, 0);
	
	} else {
		create_bone(border_instance.x + border_instance.right + 10, border_instance.y + border_instance.down, obj_bone_blue_papyrus, speed_bone, border_instance._frame_right_height / 18.5, 180, 0);
	}

}

var period = 35 - _power;
var repeats = 10 + _power * 2;

time_source_update_two_bone = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_two_bone();
}, [], -1);

time_source_destroy_update = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
});
