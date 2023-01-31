/// @desc Bones
_time++;

_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0:	// Кости вылезают из стенок
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.red);
		
		if(_time % (30 - 3 * _power) == 1 and _time < 240 + 20 * _power) {
			var coord = [];
			coord = rand_side_from(_border.x - _border.left - 40, _border.y - _border.up - 40, _border.x + _border.right + 40, _border.y + _border.down + 40);
			var bone_dir = point_direction(coord[0], coord[1], _border.x, _border.y);
			var bone_speed = 1 + 0.2 * _power;
			var _inst = create_bone(coord[0], coord[1], bone_topref_obj, bone_speed, random_range(2, 6), bone_dir, bone_dir - 90);
			++num;
		}

		if(_time > 300 + 20 * _power)
			instance_destroy();
		break;
	
	case 1:	// Кости вылетают справа и слева
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.red);
		
		if(_time % (12 - 2 * _power) == 1 and _time < 240 + 20 * _power) {
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
			create_bone(_border.x + rand_x, _border.y + rand_y, bone_topref_obj, 2 + 0.2 * _power, 1, rand_dir, rand_ang);
		}

		if(_time > 300 + 20 * _power)
			instance_destroy();
		break;
		
	case 2: //Обстрел костями сверху
		_border = battle_border_create(battle_border.up - 15, battle_border.down - 15, battle_border.left - 20, battle_border.right - 20);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		if(_time % (20 - 3 * _power) == 1 and _time < 240 + 20 * _power) {
			var rand_x = choose(_border.x - _border.left - 10, _border.x + _border.right + 10);
			var bone_dir = point_direction(rand_x, _border.y - 10, _soul.x, _soul.y);
			var bone_speed = 2 + 0.2 * _power;
			var _inst = create_bone(rand_x, _border.y - 10, bone_topref_obj, bone_speed, 1, bone_dir, bone_dir - 90);
			audio_play_sound_plugging(snd_projectile);
		}
		
		if(_time > 280 + 20 * _power)
			instance_destroy();
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
			if (chance > 4 or chance == 1) {
				create_bone(_border.x - _border.left, _border.y + _border.down, bone_obj, main_speed, 1.4, 0, 0);
			}
			if (chance >= 2 and chance != 5) {
				create_bone(_border.x + _border.right, _border.y + 15, bone_obj, -main_speed, 1.4, 0, 0);
			}
			if (chance % 2 == 0) {
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
}