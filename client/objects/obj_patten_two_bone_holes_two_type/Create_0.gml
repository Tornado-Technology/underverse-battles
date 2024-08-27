side = dir.down;
callback = function () {
	soul_instance = use_gravity_attack ? create_soul(border_instance.x, border_instance.y + border_instance.down - 5, battle_soul_type.blue) : create_soul(border_instance.x, border_instance.y + border_instance.down - 5, battle_soul_type.red);

	update_two_bone();
	time_source_start(time_source_update);
	time_source_start(time_source_update_two_bone);
	time_source_start(time_source_destroy_update);
}

update = function () {
	side = fight_random_choose(dir.up, dir.down);	
	if (use_gravity_attack) {
		soul_instance.change_gravity_force(side);
	};
		
	character_instance.change_sprite_hand_dir(side);
}

update_two_bone = function () {
		var speed_bone = 3 + _power * 0.1;
		
		
		var size_bone_main = border_instance._frame_right_height;
	
		size_bone_main -= 8 - (_power + 1);	

		size_bone_main /= fight_random_float(21, 24);
		var size_bone = size_bone_main / fight_random_float(4, 5);
		var bone_main_y = border_instance.y - border_instance.up - 10;
		var bone_main_x = border_instance.x + border_instance.right + 20;	
		var bone_y = border_instance.y + border_instance.down + 10;
		var direction_bone = point_direction(bone_main_x, bone_main_y, border_instance.x, bone_main_y);
		
		
		if (side  == dir.up) {
			create_bone(bone_main_x,bone_main_y, bone, speed_bone, size_bone, direction_bone, 180);
			create_bone(bone_main_x, bone_y, bone, speed_bone, size_bone_main, direction_bone, 0);
			create_bone(border_instance.x - border_instance.left - 20, bone_main_y, bone, speed_bone,size_bone, 0, 180);
			create_bone(border_instance.x - border_instance.left - 20, bone_y, bone, speed_bone, size_bone_main, 0, 0);
			return;
		};
	
		create_bone(bone_main_x, bone_main_y, bone, speed_bone, size_bone_main, direction_bone, 180);
		create_bone(bone_main_x, bone_y, bone, speed_bone, size_bone, direction_bone, 0);
		create_bone(border_instance.x - border_instance.left - 20, bone_main_y, bone, speed_bone, size_bone_main, 0, 180);
		create_bone(border_instance.x - border_instance.left - 20, bone_y, bone, speed_bone, size_bone, 0, 0);
}


switch (_power) {
	case 0:
		period = 70;
		repeats = 5;
		break;
	case 1:
		period = 65;
		repeats = 6;
		break;
	case 2:
		period = 55;
		repeats = 7;
		break;
	case 3:
		period = 50;
		repeats = 8;
		break;
	case 4:
		period = 50;
		repeats = 10;
		break;
}


time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_two_bone = time_source_create(time_source_game, (period + 2) / 60, time_source_units_seconds, function () {
	update_two_bone();
}, [], -1);

time_source_destroy_update = time_source_create(time_source_game, (period * repeats) / 60, time_source_units_seconds, function () {
	character_instance.stop_hand_wave();
	instance_destroy();	
});
