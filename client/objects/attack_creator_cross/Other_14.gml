/// @description Methods

// Кости вылезают из стенок
if (_id == 0 && attack_num == 0) {
	update_0_0 = function(pow) {
		var coord = [];
		coord = rand_side_from(_border.x - _border.left - 40, _border.y - _border.up - 40, _border.x + _border.right + 40, _border.y + _border.down + 40);
		var bone_dir = point_direction(coord[0], coord[1], _border.x, _border.y);
		var bone_speed = 1.3 + 0.2 * pow;
		create_bone(coord[0], coord[1], bone_topref_obj, bone_speed, random_range(2, 6), bone_dir, bone_dir - 90);
		++num;
	}
}

// Кости вылетают справа и слева
if (_id == 0 && attack_num == 1) {
	update_0_1 = function(pow) {
		var rand_side = irandom_range(0, 1);
		var rand_y = random_range(-_border.up + 3, _border.down - 3);
		var rand_x = -_border.left - 15;
		var rand_dir = 0;
		var rand_ang = 90;
		if (rand_side == 1) {
			rand_x = _border.right + 15;
			rand_dir = 180;
			rand_ang = 270;
		}
		create_bone(_border.x + rand_x, _border.y + rand_y, bone_topref_obj, 2 + 0.2 * pow, 1, rand_dir, rand_ang);
	}
}

// Обстрел костями сверху
if (_id == 0 && attack_num == 2) {
	update_0_2 = function(pow) {
		var rand_x = choose(_border.x - _border.left - 10, _border.x + _border.right + 10);
		var bone_dir = point_direction(rand_x, _border.y - _border.up - 10, _soul.x, _soul.y);
		var bone_speed = 2 + 0.2 * pow;
		create_bone(rand_x, _border.y - _border.up - 5, bone_topref_obj, bone_speed, 1, bone_dir, bone_dir - 90);
		audio_play_sound_plugging(snd_projectile);
	}
}

// Платформы и кости
if (_id == 0 && attack_num == 3) {
	update_0_3 = function(pow) {
		var main_speed = 1 + pow * 0.1;
		var chance = irandom_range(0, 6);
		if (chance % 2 == 0) {
			create_bone(_border.x - _border.left, _border.y + _border.down, bone_obj, main_speed, 1.4, 0, 0);
		}
		if (chance > 2 && chance != 5) {
			create_bone(_border.x + _border.right, _border.y + 15, bone_obj, -main_speed, 1.4, 0, 0);
		}
		if (chance > 4 || chance == 1) {
			create_bone(_border.x - _border.left, _border.y - 15, bone_obj, main_speed, 1.4, 0, 0);
		}
	}
	
	update_0_3_2 = function(pow) {
		if (pow >= 3) {
			create_aiming_gasterblaster(aim_gb_obj, _soul);
			time_source_start(time_source_update_0_3_2);
		}
	}
	
	update_0_3_3 = function(pow) {
		var main_speed = 1 + pow * 0.1;
		create_next_moving_platform(_border.x - _border.left - 40, _border.y - 15, 4, 6, 60, main_speed);
		create_next_moving_platform(_border.x + _border.right + 40, _border.y + 15, 4, 6, 60, -main_speed);
	}
}

// Наводящиеся гастербластеры
if (_id == 1 && attack_num == 0) {
	update_1_0 = function(pow) {
		create_aiming_gasterblaster(aim_gb_obj, _soul);
	}
	
	update_1_0_2 = function(pow) {
		repeat (2) { create_aiming_gasterblaster(aim_gb_obj, _soul); }
	}
}

// Синяя душа и гастербластеры
if (_id == 1 && attack_num == 1) {
	update_1_1 = function(pow) {
		repeat (2) { create_aiming_gasterblaster(aim_gb_obj, _soul); }
	}
}

// Платформы и гастербластеры
if (_id == 1 && attack_num == 2) {
	update_1_2 = function(pow) {
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
	
	update_1_2_2 = function(pow) {
		var main_speed = 0.5 + pow * 0.1;
		var sector_y_step = 35;
		var sector_y = _border.y - _border.up + 25;
		create_next_moving_platform(_border.x - _border.left - 40, sector_y, 4, 6, 60, main_speed);
		create_next_moving_platform(_border.x + _border.right + 40, sector_y + sector_y_step, 4, 6, 60, -main_speed);
		create_next_moving_platform(_border.x - _border.left - 40,  sector_y + sector_y_step * 2, 4, 6, 60, main_speed);
	}
}

// Синяя атака
if (_id == 2) {
	update_2_0 = function() {
		side = choose(dir.up, dir.down, dir.left, dir.right);
			if (attack_num == 0) {
				_soul.change_gravity_force(side);
			}
			var i = 0;
			
			if (attack_num == 0) {
				var warning_scale = 5;
			}
			else {
				var warning_scale = 12;
			}
			draw_warning(side, warning_scale);
			audio_play_sound_plugging(snd_warning);
			
			repeat(array_length(_bones)) {
				instance_destroy(_bones[i]);
				_bones[i] = noone;
				++i;
			}

			repeat(num) {
				if (side == dir.up) {
					_bones[i] = create_bone(_border.x - _border.left + i * 10, _border.y - _border.up - 25, bone_obj, 0, 1, 0, 180);
				}
				if (side == dir.down) {
					_bones[i] = create_bone(_border.x - _border.left + i * 10, _border.y + _border.down + 25, bone_obj, 0, 1, 0, 0);
				}
				if (side == dir.left) {
					_bones[i] = create_bone(_border.x - _border.left - 25, _border.y - _border.up + i * 10, bone_obj, 0, 1, 0, 270);
				}
				if (side == dir.right) {
					_bones[i] = create_bone(_border.x + _border.right + 25, _border.y - _border.up + i * 10, bone_obj, 0, 1, 0, 90);
				}
				++i;
			}
			character_instance.change_sprite_hand_dir(side);
	}

	update_2_1 = function() {
		var i = 0;
		repeat(num) {
			_bones[i].change_scale(bone_scale, 0.2);
			++i;
		}
		instance_destroy(obj_warning);
		audio_play_sound_plugging(snd_spare_up);
	}

	update_2_2 = function() {
		var i = 0;
		repeat(num) {
			_bones[i].change_scale(1, 0.2);
			++i;
		}
	}
}

// Крестоносец
if (_id == 3) {
	update_3_0 = function() {
		var bone_angle_speed = choose(1, -1);
		_bones[0].angle_speed = bone_angle_speed;
		_bones[1].angle_speed = bone_angle_speed;
	}
	
	update_3_1 = function() {
		create_aiming_gasterblaster(aim_gb_obj, _soul);
	}
	
	update_3_2 = function() {
		var rand_side = rand_side_from(_border.x - _border.left - 15, _border.y - _border.up - 15, _border.x + _border.right + 15, _border.y + _border.down + 15);
		var bone_dir = point_direction(rand_side[0], rand_side[1], _soul.x, _soul.y);
		var bone_speed = 2.2;
		create_bone(rand_side[0], rand_side[1], bone_topref_obj, bone_speed, 1, bone_dir, bone_dir - 90);
		audio_play_sound_plugging(snd_projectile);
	}
	
	update_3_3 = function() {
		_bones[0].change_scale(0, 0.1);
		_bones[1].change_scale(0, 0.1);
	}
	
	update_3_4 = function() {
		_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.blue);
		instance_destroy(_bones[0]);
		instance_destroy(_bones[1]);
	}
	
	update_3_5 = function() {
		repeat (2) create_aiming_gasterblaster(aim_gb_obj, _soul);
	}
}