/// @desc Bones
_time++;

switch (attack_num) {
	case 0:	// Волна из костей
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.red);
		
		if(_time % (10 - _power) == 1 && _time < 240 + 20 * _power) {
			var bone_speed = 3 + _power;
			var bone_size = _power < 4 ? 4.4 + _shift : 4.5 + _shift;
			var _inst1 = create_bone(_border.x - _border.left, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 0, 0);
			var _inst2 = create_bone(_border.x - _border.left, _border.y - _border.up - 20, bone_obj, bone_speed, 9-bone_size, 0, 180);
			_shift = sin(wave_time);
			wave_time += 0.8;
		}

		if(_time > 300 + 20 * _power)
			instance_destroy();
		break;
		
	case 1: // Перепыгивание через кости
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		// Attack
		create_soul(_border.x, _border.y + _border.down - 9, battle_soul_type.blue);
		if(_time % 60 == 1 and _time < 260 + 60 * _power) {
			var side = irandom_range(0, 2);
			var bone_speed = 1.8;
			var bone_size = random_range(1.8, 3.5);
			if (_power > 1) {
				bone_speed = 2.7;
				bone_size = random_range(1.5, 2.9);
			}
			if (_power > 3) {
				bone_speed = 3.7;
				bone_size = random_range(1.3, 2.2);
			}
			
			var bone_up_size = 9.5 - bone_size;
			if (_power > 2)
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
		
		if(_time > 340 + 60 * _power) { instance_destroy(); }
		break;
		
	case 2: // Две кости
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		if (_time == 1) {
			_side = irandom_range(0, 1);
		}

		if(_time % (60 - 5 * _power) == 1 && _time < (60 - 5 * _power) * (5 + _power)) {
			var bone_speed = 1.5 + 0.5*_power;
			var bone_size = 5.5;
			if (_side == 0) {
				create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 0, 180);
				create_bone(_border.x + _border.right + 20, _border.y + _border.right + 20, bone_obj, bone_speed, bone_size, 180, 0);
			}
			if (_side == 1) {
				create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 270, 270);
				create_bone(_border.x + _border.right + 20, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 90, 90);
			}
		}
		
		if(_time > (60 - 5 * _power) * (6 + _power)) { instance_destroy(); }
		break;
	
	case 3: // Платформы и кости
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y + _border.down - 9, battle_soul_type.blue);
		
		var main_speed = 1 + _power * 0.1;
		create_moving_platforms(_border.x - _border.left - 40, _border.y - 15, 4, 6, 60, main_speed, 0);
		create_moving_platforms(_border.x + _border.right + 40, _border.y + 15, 4, 6, 60, -main_speed, 1);
		
		if(_time % (60 - 5 * _power) == 1 && _time < 360 + 50 * _power) {
			var chance = irandom_range(0, 6);
			if (chance % 2 == 0) {
				create_bone(_border.x - _border.left, _border.y + _border.down, bone_obj, main_speed, 1.4, 0, 0);
			}
			if (chance > 2 and chance != 5) {
				create_bone(_border.x + _border.right, _border.y + 15, bone_obj, -main_speed, 1.4, 0, 0);
			}
			if (chance > 4 or chance == 1) {
				create_bone(_border.x - _border.left, _border.y - 15, bone_obj, main_speed, 1.4, 0, 0);
			}
		}
		
		// Дополнительные гастербластеры
		if (_power >= 3) { 
			if(_time % 120 == 1 && _time <= 120 * 3) {
				create_aiming_gasterblaster(obj_gasterblaster_aiming_sans, _soul);
			}
		}
		
		if(_time > 360 + 50 * _power) { instance_destroy(); }
		break;
	
	case 4: // Сдвиг и перепрыгивание
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y + _border.down - 9, battle_soul_type.blue);
		
		var period = 60 - _power * 4;
		if(_time % period == 1 and _time < 260 + 60 * _power) {
			var bone_speed = 1.2 + _power * 0.2;
			create_bone(_border.x - _border.left - 10, _border.y + _border.down + 20, bone_obj, bone_speed, 2, 0, 0);
			create_bone(_border.x + _border.right + 10, _border.y - _border.up - 20, bone_obj, bone_speed, 5.4, 180, 180);
		}
		
		if(_time > (260 + 60 * _power) + period) { instance_destroy(); }
		break;
}