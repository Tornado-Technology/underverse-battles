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
		
	case 1: // Летящие кости справа и слева
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		// Attack
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		var period = 33 - 2 * _power;
		var per_num = 10 + _power * 2;
		if(_time % period == 1 && _time < per_num * period) {
			var side = irandom_range(0, 1);
			var _inst;
			
			if (side == 0) {
				_inst = instance_create_depth(_border.x - _border.left - 10, _soul.y, fight_depth.bullet_outside, spin_bone_obj);
				_inst._speed = 3 + _power * 0.1;
				_inst._angle = 0;
			} else {
				_inst = instance_create_depth(_border.x + _border.right + 10, _soul.y, fight_depth.bullet_outside, spin_bone_obj);
				_inst._speed = 3 + _power * 0.1;
				_inst._angle = 180;
			}
			audio_play_sound_plugging(snd_projectile);
		}
		
		if(_time > per_num * period)
			instance_destroy();
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
		
	case 3: // Летящие кости сверху
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y + _border.down - 9, battle_soul_type.blue);
		
		var period = 33 - 3 * _power;
		var per_num = 10 + _power * 2;
		if(_time % period == 1 && _time < per_num * period) {
			var rand_x = irandom_range(-_border.left, _border.right);
			var _inst = instance_create_depth(_border.x + rand_x, _border.y - _border.up - 10, fight_depth.bullet_outside, spin_bone_obj);
			_inst._speed = 3 + _power * 0.1;
			_inst._angle = point_direction(_inst.x, _inst.y, _soul.x, _soul.y);
			audio_play_sound_plugging(snd_projectile);
		}
		
		if(_time > per_num * period + 20) { instance_destroy(); }
	break;
}