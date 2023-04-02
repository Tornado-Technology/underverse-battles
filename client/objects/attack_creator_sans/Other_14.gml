/// @description Methods

// Волна из костей
if (_id == 0 && attack_num == 0) {
	update_0_0 = function(pow) {
		var bone_speed = 3 + pow;
		var bone_size = pow < 4 ? 4.4 + _shift : 4.5 + _shift;
		create_bone(_border.x - _border.left, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 0, 0);
		create_bone(_border.x - _border.left, _border.y - _border.up - 20, bone_obj, bone_speed, 9-bone_size, 0, 180);
		_shift = sin(wave_time);
		wave_time += 0.8;
	}
}

// Перепыгивание через кости
if (_id == 0 && attack_num == 1) {
	update_0_1 = function(pow) {
		var side = irandom_range(0, 2);
		var bone_speed = 1.8;
		var bone_size = random_range(1.8, 3.5);
		if (pow > 1) {
			bone_speed = 2.7;
			bone_size = random_range(1.5, 2.9);
		}
		if (pow > 3) {
			bone_speed = 3.7;
			bone_size = random_range(1.3, 2.2);
		}
			
		var bone_up_size = 9.5 - bone_size;
		if (pow > 2)
			bone_up_size = 10 - bone_size;
			
		if (side == 0 || side == 2) {
			create_bone(_border.x - _border.left, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 0, 0);
			create_bone(_border.x - _border.left, _border.y - _border.up - 20, bone_obj, bone_speed, bone_up_size, 0, 180);
		}
		if (side == 1 || side == 2) {
			create_bone(_border.x + _border.right, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 180, 0);
			create_bone(_border.x + _border.right, _border.y - _border.up - 20, bone_obj, bone_speed, bone_up_size, 180, 180);
		}
	}
}

// Две кости
if (_id == 0 && attack_num == 2 || _id == 3) {
	update_0_2 = function(pow) {
		var bone_speed = 1.5 + 0.3;
		var bone_size = _id == 0 ? 5.4 : 4.2;
		if (_side == dir.up) {
			create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 0, 180);
			create_bone(_border.x + _border.right + 20, _border.y + _border.right + 20, bone_obj, bone_speed, bone_size, 180, 0);
		}
		if (_side == dir.down) {
			create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 270, 270);
			create_bone(_border.x + _border.right + 20, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 90, 90);
		}
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
			create_aiming_gasterblaster(obj_gasterblaster_aiming_sans, _soul);
			time_source_start(time_source_update_0_3_2);
		}
	}
	
	update_0_3_3 = function(pow) {
		var main_speed = 1 + pow * 0.1;
		create_next_moving_platform(_border.x - _border.left - 40, _border.y - 15, 4, 6, 60, main_speed);
		create_next_moving_platform(_border.x + _border.right + 40, _border.y + 15, 4, 6, 60, -main_speed);
		time_source_start(time_source_update_0_3_3);
	}
}

// Сдвиг и перепрыгивание
if (_id == 0 && attack_num == 4) {
	update_0_4 = function(pow) {
		var bone_speed = 1.2 + pow * 0.2;
		create_bone(_border.x - _border.left - 10, _border.y + _border.down + 20, bone_obj, bone_speed, 2, 0, 0);
		create_bone(_border.x + _border.right + 10, _border.y - _border.up - 20, bone_obj, bone_speed, 5.4, 180, 180);
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

// Крестовые гастербластеры
if (_id == 1 && attack_num == 1) {
	update_1_1 = function(pow) {
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
		time_source_start(time_source_update_1_2_2);
	}
}

// Синяя атака
if (_id == 2 || _id == 3) {
	update_2_0 = function() {
		side = choose(dir.up, dir.down, dir.left, dir.right);
			new_warning = true;
			if (attack_num == 0) {
				_soul.gravity_force = side;
				_soul.max_fly_time = 60;
				_soul.fly_time = _soul.max_fly_time;
				_soul.blue_attack = true;
				_soul.addit_spd = 5;
			}
			var i = 0;

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
			_bones[i].scale_const = bone_scale;
			_bones[i].scale_time = 0.2;
			++i;
		}
		instance_destroy(obj_warning);
		audio_play_sound_plugging(snd_spare_up);
	}

	update_2_2 = function() {
		var i = 0;
		repeat(num) {
			_bones[i].scale_const = 1;
			_bones[i].scale_time = 0.2;
			++i;
		}
	}
}

if (_id == 3) {
	update_3_5 = function() {
		var radius = _border.up * 2;
		var x_gb = _border.x + radius * cos(degtorad(_angle));
		var y_gb = _border.y + radius * sin(degtorad(_angle));
		create_gasterblaster(gb_obj, x_gb, y_gb, _border.x, _border.y, point_direction(x_gb, y_gb, _border.x, _border.y) + 90);
		_angle += angle_step;
	}
	
	update_3_5_2 = function() {
		angle_step = 15;
	}
}