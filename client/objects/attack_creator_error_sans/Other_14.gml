/// @description Methods

// Падающие кости
if (_id == 0 && attack_num == 0 || _id == 0 && attack_num == 3) {
	update_0_0 = function (pow, side) {
		var bone_y = _border.y - _border.up - 15;
		if (side == dir.down) bone_y = _border.y + _border.down + 15;
		
		var rand_place = irandom_range(0, 2);
		if (rand_place == 0)
			_bones[num] = instance_create_depth(_soul.x, bone_y, fight_depth.bullet_outside, bone_sharp_obj);
		else {
			var rand_x = irandom_range(_border.x - _border.left, _border.x + _border.right);
			_bones[num] = instance_create_depth(rand_x, bone_y, fight_depth.bullet_outside, bone_sharp_obj);
		}
		
		var bone_angle = 180;
		if (side == dir.down) bone_angle = 0;
		_bones[num].image_angle = bone_angle;
		_bones[num].direction = bone_angle + 90;
		_bones[num].set_fall(2, 0.04 + pow * 0.02);
		num++;
	}
}

// Тыкающие кости
if (_id == 0 && attack_num == 1) {
	update_0_1 = function (pow) {
		var coord = [];
		coord = rand_side_from(_border.x - _border.left - 40, _border.y - _border.up - 40, _border.x + _border.right + 40, _border.y + _border.down + 40);
		_bones[num] = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside, bone_sharp_obj);
		_bones[num].direction = point_direction(_bones[num].x, _bones[num].y, _border.x, _border.y);
		_bones[num].image_angle = _bones[num].direction - 90;
		_bones[num].image_yscale = 3.2;
		_bones[num].speed_const = 1.5 + 0.1 * pow;
		_bones[num].set_move_back();
		++num;
		audio_play_sound_plugging(snd_projectile);
	}
}

// Две кости
if (_id == 0 && attack_num == 2) {
	update_0_2 = function(pow) {
		var bone_speed = 1.5 + 0.3;
		var bone_size = _id == 0 ? 5.4 : 4.2;
		if (_side == dir.left) {
			create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 0, 180);
			create_bone(_border.x + _border.right + 20, _border.y + _border.right + 20, bone_obj, bone_speed, bone_size, 180, 0);
		}
		if (_side == dir.up) {
			create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 270, 270);
			create_bone(_border.x + _border.right + 20, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 90, 90);
		}
	}
}

// Платформы и падающие кости
if (_id == 0 && attack_num == 3) {
	update_0_3 = function(pow) {
		var main_speed = 1 + pow * 0.2;
		create_next_moving_platform(_border.x - _border.left - 40, _border.y - 20, 2, 10, 120, main_speed);
		create_next_moving_platform(_border.x + _border.right + 40, _border.y + 20, 2, 10, 120, -main_speed);
	}
}

// Нити
if (_id == 1) {
	update_1_0 = function(pow) {
		var coord = [];
		coord = rand_side_from(-1, -1, room_width + 1, room_height + 1);
	
		var blue_string = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, obj_thread_error_sans);
		blue_string.x_dir = _soul.x;
		blue_string.y_dir = _soul.y;
		blue_string.scale_speed = 3.4 + pow * 0.1;
	
		audio_play_sound_plugging(snd_string);
	}
	
	update_1_0_2 = function() {
		var coord = [];
		coord = rand_side_from(_border.x - _border.left - 15, _border.y - _border.up - 15, _border.x + _border.right + 15, _border.y + _border.down + 15);
		var bone = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, bone_sharp_obj);
		bone.direction = point_direction(bone.x, bone.y, _soul.x, _soul.y);
		bone.image_angle = bone.direction - 90;
		bone.speed_const = 4;
		audio_play_sound_plugging(snd_projectile);
	}
}

// Наводящиеся гастербластеры
if (_id == 2 && attack_num == 0) {
	update_2_0 = function(pow) {
		create_aiming_gasterblaster(aim_gb_obj, _soul);
	}
	
	update_2_0_2 = function(pow) {
		repeat (2) { create_aiming_gasterblaster(aim_gb_obj, _soul); }
	}
}

// Крестовые гастербластеры
if (_id == 2 && attack_num == 1) {
	update_2_1 = function(pow) {
		var x_gb, y_gb;
		var gb_size = 60;
		var pos = irandom_range(0, 3);
		var con = room_height + gb_size;
		var rnd = irandom_range(-gb_size, con);
			
		repeat(2) {
			switch (pos) {
				case 0:
					x_gb = -gb_size;
					y_gb = rnd;
					break;
		
				case 1:
					x_gb = rnd;
					y_gb = con;
					break;
		
				case 2:
					x_gb = con;
					y_gb = rnd;
					break;
		
				case 3:
					x_gb = rnd;
					y_gb = -gb_size;
					break;
			}
			create_gasterblaster(gb_obj, x_gb, y_gb, _border.x, _border.y, point_direction(x_gb, y_gb, _border.x, _border.y) + 90);
			pos = (pos + 1) % 4;
		}
	}
}

// Платформы и гастербластеры
if (_id == 2 && attack_num == 2) {
	update_2_2 = function(pow) {
		var _gb_pos = irandom_range(0, 2);
		var border_dist = 180;
		var sector_y_step = 35;
		var sector_y = _border.y - _border.up + 25;
		switch (_gb_pos) {
			case 0:
				create_gasterblaster(gb_obj, _border.x + border_dist, sector_y - 5, _border.x, sector_y - 5,  270);
				break;
			case 1:
				create_gasterblaster(gb_obj, _border.x + border_dist, sector_y + sector_y_step - 5, _border.x, sector_y + sector_y_step - 5,  270);
				break;
			case 2:
				create_gasterblaster(gb_obj, _border.x + border_dist, sector_y + sector_y_step * 2 - 5, _border.x, sector_y + sector_y_step * 2 - 5,  270);
				break;
		}
	}
	
	update_2_2_2 = function(pow) {
		var main_speed = 0.5 + pow * 0.1;
		var sector_y_step = 35;
		var sector_y = _border.y - _border.up + 25;
		create_next_moving_platform(_border.x - _border.left - 40, sector_y, 4, 6, 60, main_speed);
		create_next_moving_platform(_border.x + _border.right + 40, sector_y + sector_y_step, 4, 6, 60, -main_speed);
		create_next_moving_platform(_border.x - _border.left - 40,  sector_y + sector_y_step * 2, 4, 6, 60, main_speed);
	}
}

// Паническая атака
if (_id == 3) {
	update_3_0 = function() {
		var random_side = irandom_range(0, 1);
		var random_x = _border.x - _border.left - 10;
		var random_y = irandom_range(_border.y - _border.up, _border.y + _border.down);
		var random_direction = 0;
		if (random_side == 0) {
			random_x = _border.x + _border.right + 10;
			random_direction = 180;
		}
		create_bone(random_x, random_y, bone_sharp_obj, 3, 1, random_direction, random_direction - 90);
		audio_play_sound_plugging(snd_projectile);
	}
	
	update_3_1 = function() {
		repeat (3) { create_aiming_gasterblaster(obj_gasterblaster_aiming_error_sans, _soul); }
	}
}