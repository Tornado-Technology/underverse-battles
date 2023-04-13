/// @description Methods

// Кости на всю высоту
if (_id == 0 && attack_num == 0) {
	update_0_0 = function(pow) {
		var rand_side = choose(dir.up, dir.down, dir.left, dir.right);
		var bone_speed = 2 + pow * 0.2;
		var bone_size = 8.3;
		if (rand_side == dir.left) {
			var _inst = create_bone(_border.x - _border.left - 4, _border.y + _border.down, bone_obj,
			bone_speed, bone_size, 0, 0);
		}
		else if (rand_side == dir.right) {
			var _inst = create_bone(_border.x + _border.right + 4, _border.y + _border.down, bone_obj,
			bone_speed, bone_size, 180, 0);
		}
		else if (rand_side == dir.down) {
			var _inst = create_bone(_border.x + _border.right, _border.y + _border.down + 4, bone_obj,
			bone_speed, bone_size, 90, 90);
		}
		else if (rand_side == dir.up) {
			var _inst = create_bone(_border.x + _border.right, _border.y - _border.up - 4, bone_obj,
			bone_speed, bone_size, 270, 90);
		}
	}
}

// Кости и оранжевые кости
if (_id == 0 && attack_num == 1) {
	update_0_1 = function(pow) {
		var _bone = bone_obj;
		var rand_side = irandom_range(0, 7);
		var rand_bone_type = irandom_range(0, 1);
		if (rand_bone_type == 0)
			_bone = bone_orange_obj;
		var rand_speed = 2 + random_range(0, pow * 0.2);
			var max_size = 8.3;
			var rand_size = rand_bone_type == 0 ? max_size : random_range(3 + pow * 0.2, 6);
			if (rand_side == 0) {
				var _inst = create_bone(_border.x - _border.left - 4, _border.y + _border.down, _bone,
				rand_speed, rand_size, 0, 0);
			}
			if (rand_side == 1) {
				var _inst = create_bone(_border.x + _border.right + 4, _border.y - _border.up, _bone,
				rand_speed, rand_size, 180, 180);
			}
			if (rand_side == 2) {
				var _inst = create_bone(_border.x - _border.left - 4, _border.y - _border.up, _bone,
				rand_speed, rand_size, 0, 180);
			}
			if (rand_side == 3) {
				var _inst = create_bone(_border.x + _border.right + 4, _border.y + _border.down, _bone,
				rand_speed, rand_size, 180, 0);
			}
			if (rand_side == 4) {
				var _inst = create_bone(_border.x + _border.right, _border.y + _border.down + 4, _bone,
				rand_speed, rand_size, 90, 90);
			}
			if (rand_side == 5) {
				var _inst = create_bone(_border.x - _border.left, _border.y - _border.up - 4, _bone,
				rand_speed, rand_size, 270, 270);
			}
			if (rand_side == 6) {
				var _inst = create_bone(_border.x - _border.left, _border.y + _border.down + 4, _bone,
				rand_speed, rand_size, 90, 270);
			}
			if (rand_side == 7) {
				var _inst = create_bone(_border.x + _border.right, _border.y - _border.up - 4, _bone,
				rand_speed, rand_size, 270, 90);
			}
	}
}

// Авиаудар костями
if (_id == 0 && attack_num == 2) {
	update_0_2 = function(pow) {
		var indent_x = 100;
		var interval_x = 4;
		var bone_x = irandom_range(_border.x - _border.left - indent_x, _border.x + _border.right - interval_x);
		var bone_speed = 2.6 + pow * 0.2;
		_bones[num] = create_bone(bone_x, _border.y - _border.up - 20, bone_sharp_obj,
		bone_speed, 1.5, -60, 210);
		_bones[num].stuck();
		num++;
		audio_play_sound_plugging(snd_projectile);
		
	}
}

// Вращающиеся кости крестом с перемещением
if (_id == 1 && attack_num == 0) {
	update_1_0 = function(pow) {
		var bone_speed = 1.5 + pow * 0.2;
		var bone_size = 6.6;
		var angle_speed = 1.2 + pow * 0.2;
		var random_y = choose(-15, 0, 15);
		var random_angle = choose(0, 20, 45, 65, 90);
		if (rand_num == 0) {
			create_bone_spinning(_border.x - _border.left * 2, _border.y + random_y, bone_spin_obj, bone_speed, bone_size, 0, random_angle, angle_speed);
			create_bone_spinning(_border.x - _border.left * 2, _border.y + random_y, bone_spin_obj, bone_speed, bone_size, 0, random_angle + 90, angle_speed);
		}
		if (rand_num == 1) {
			create_bone_spinning(_border.x + _border.right * 2, _border.y + random_y, bone_spin_obj, bone_speed, bone_size, 180, random_angle, angle_speed);
			create_bone_spinning(_border.x + _border.right * 2, _border.y + random_y, bone_spin_obj, bone_speed, bone_size, 180, random_angle + 90, angle_speed);
		}
		if (rand_num == 2) {
			create_bone_spinning(_border.x - _border.left * 2, _border.y + random_y, bone_spin_obj, bone_speed, bone_size, 0, random_angle, -angle_speed);
			create_bone_spinning(_border.x - _border.left * 2, _border.y + random_y, bone_spin_obj, bone_speed, bone_size, 0, random_angle + 90, -angle_speed);
		}
		if (rand_num == 3) {
			create_bone_spinning(_border.x + _border.right * 2, _border.y + random_y, bone_spin_obj, bone_speed, bone_size, 180, random_angle, -angle_speed);
			create_bone_spinning(_border.x + _border.right * 2, _border.y + random_y, bone_spin_obj, bone_speed, bone_size, 180, random_angle + 90, -angle_speed);
		}
	}
}

// Вращающиеся кости крестом по центру
if (_id == 1 && attack_num == 1) {
	update_1_1 = function() {
		var random_number = irandom_range(0, 1);
		if (random_number == 0) {
			_inst1.angle_speed = -_inst1.angle_speed;
			_inst2.angle_speed = -_inst2.angle_speed;
		}
	}
}

// Вращающиеся кости с двух сторон с перемещением
if (_id == 1 && attack_num == 2) {
	update_1_2 = function(pow) {
		var bone_speed = 1.5 + pow * 0.2;
		var bone_size = 3.2;
		var angle_speed = 1.5 + pow * 0.2;
		var random_side = choose(dir.left, dir.right);
		var random_y = choose(-30, -15, 0, 15, 30);
		var random_angle = choose(0, 20, 45, 65, 90);
		if (random_side == dir.left)
			create_bone_spinning(_border.x - _border.left * 2, _border.y + random_y, bone_spin_obj, bone_speed, bone_size, 0, random_angle, angle_speed);
		if (random_side == dir.right)
			create_bone_spinning(_border.x + _border.right * 2, _border.y + random_y, bone_spin_obj, bone_speed, bone_size, 180, random_angle, angle_speed);
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

// Кости в виде платформ и гастербластеры
if (_id == 2 && attack_num == 2) {
	update_2_2 = function() {
		var position_number = irandom_range(0, 2);
		var border_distance = 180;
		switch (position_number) {
			case 0:
				create_gasterblaster(gb_obj, _border.x + border_distance, _border.y + 28, _border.x, _border.y + 30,  270);
				break;
			case 1:
				create_gasterblaster(gb_obj, _border.x + border_distance, _border.y, _border.x, _border.y,  270);
				break;
			case 2:
				create_gasterblaster(gb_obj, _border.x + border_distance, _border.y - 28, _border.x, _border.y - 30,  270);
				break;
		}
	}
	update_2_2_2 = function(pow) {
		var bone_speed = 1 + pow * 0.1;
		var bone = create_bone(_border.x - _border.left - 4, _border.y - 15, bone_obj,
			bone_speed, 2, 0, 90);
		var bone = create_bone(_border.x + _border.right + 4, _border.y + 15, bone_obj,
			bone_speed, 2, 180, 270);
	}
}

// Костяная завеса
if (_id == 3) {
	update_3_0 = function() {
		var bone_speed = 1;
		var bone_size = 8.3;
		create_bone(_border.x - _border.left - 4, _border.y + _border.down, bone_obj, bone_speed, bone_size, 0, 0);
		create_bone(_border.x + _border.right + 4, _border.y + _border.down, bone_obj, bone_speed, bone_size, 180, 0);
		create_bone(_border.x + _border.right, _border.y + _border.down + 4, bone_obj, bone_speed, bone_size, 90, 90);
		create_bone(_border.x + _border.right, _border.y - _border.up - 4, bone_obj, bone_speed, bone_size, 270, 90);
	}
	
	update_3_1 = function() {
		var bone_speed = 2.2;
		var bone_size = 1;
		var rand_side = irandom_range(0, 3);
		var bone_x = _border.x - _border.left - 10;
		var bone_y = _border.y + _border.down + 10;
		if (rand_side == 1) {
			bone_x = _border.x + _border.right + 10;
			bone_y = _border.y - _border.up - 10;
		}
		if (rand_side == 2) {
			bone_x = _border.x + _border.right + 10;
			bone_y = _border.y + _border.down + 10;
		}
		if (rand_side == 3) {
			bone_x = _border.x - _border.left - 10;
			bone_y = _border.y - _border.up - 10;
		}
		var bone_direction = point_direction(bone_x, bone_y, _soul.x, _soul.y);
		create_bone(bone_x, bone_y, bone_sharp_obj, bone_speed, bone_size, bone_direction, bone_direction - 90);
		audio_play_sound_plugging(snd_projectile);
	}
}