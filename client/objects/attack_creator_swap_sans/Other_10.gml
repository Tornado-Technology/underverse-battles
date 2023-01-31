/// @desc Bones
_time++;

switch (attack_num) {
	case 0:	// Кости на всю высоту
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.orange);
		
		var rand_side = irandom_range(0, 3);
		
		if(_time % (48 - _power * 5) == 1 && _time < 240 + 20 * _power) {
			var bone_speed = 2 + _power * 0.2;
			var bone_size = 8.3;
			if (rand_side == 0) {
				var _inst = create_bone(_border.x - _border.left - 4, _border.y + _border.down, bone_obj,
				bone_speed, bone_size, 0, 0);
			}
			else if (rand_side == 1) {
				var _inst = create_bone(_border.x + _border.right + 4, _border.y + _border.down, bone_obj,
				bone_speed, bone_size, 180, 0);
			}
			else if (rand_side == 2) {
				var _inst = create_bone(_border.x + _border.right, _border.y + _border.down + 4, bone_obj,
				bone_speed, bone_size, 90, 90);
			}
			else if (rand_side == 3) {
				var _inst = create_bone(_border.x + _border.right, _border.y - _border.up - 4, bone_obj,
				bone_speed, bone_size, 270, 90);
			}
		}

		if(_time > 300 + 20 * _power)
			instance_destroy();
		break;
		
	case 1: // Кости и оранжевые кости
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		// Attack
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		var _bone = bone_obj;
		var rand_side = irandom_range(0, 7);
		var rand_bone_type = irandom_range(0, 1);
		if (rand_bone_type == 0)
			_bone = bone_orange_obj;
		
		if(_time % (48 - _power * 5) == 1 and _time < 240 + 60 * _power) {
			var rand_speed = 2 + random_range(0, _power * 0.2);
			var max_size = 8.3;
			var rand_size = rand_bone_type == 0 ? max_size : random_range(3 + _power * 0.2, 6);
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
		
		if(_time > 340 + 60 * _power) { instance_destroy(); }
		break;
		
	case 2: // Авиаудар костями
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left - 15, battle_border.right - 15);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
		
		_shift = 100;
		var interval = 4;
		var bone_x = irandom_range(_border.x - _border.left - _shift, _border.x + _border.right - interval);
		var bone_speed = 2.6 + _power * 0.2;
		if(_time % (16 - 3 * _power) == 1 && _time < 240 + 60 * _power) {
			_bones[num] = create_bone(bone_x, _border.y - _border.up - 20, bone_sharp_obj,
			bone_speed, 1.5, -60, 210);
			num++;
			audio_play_sound_plugging(snd_projectile);
		}
		
		var i = 0;
		repeat (num) {
			if (instance_exists(_bones[i])) {
				if (_bones[i].y > _border.y + _border.down - 5) {
					if (_bones[i].speed != 0) {
						_bones[i].speed = 0;
						audio_play_sound_plugging(snd_projectile_hit);
					}
				}
			}
			++i;
		}
		
		if(_time > 300 + 60 * _power) instance_destroy();
		break;
}