/// @desc Bones
_time++;

switch (attack_num) {
	case 0:	// Кости на всю высоту
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.orange);
		
		var rand_side = irandom_range(0, 3);
		
		if(_time % (50 - _power * 5) == 1 && _time < 240 + 20 * _power) {
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
		
		if(_time % (50 - _power * 5) == 1 and _time < 240 + 60 * _power) {
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
	
	case 2:	// Вылезающие кости из стенок
		border_decrease = 20;
		_border = battle_border_create(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.orange);
		
		var num = 10;
		var sum_num = num * 4;
		if (_time == 1) {
			var i = 0;
			repeat (num) {
				_bones[i] = instance_create_depth(_border.x - _border.left + i * 10, _border.y - _border.up - 20, fight_depth.bullet_outside, bone_obj);
				_bones[i].image_angle = 180;
				i++;
			}
			repeat (num) {
				_bones[i] = instance_create_depth(_border.x + _border.right - (i - num) * 10, _border.y + _border.down + 20, fight_depth.bullet_outside, bone_obj);
				_bones[i].image_angle = 0;
				i++;
			}
			repeat (num) {
				_bones[i] = instance_create_depth(_border.x - _border.left - 20, _border.y + _border.down - (i - 2*num) * 10, fight_depth.bullet_outside, bone_obj);
				_bones[i].image_angle = 270;
				i++;
			}
			repeat (num) {
				_bones[i] = instance_create_depth(_border.x + _border.right + 20, _border.y - _border.up + (i - 3*num) * 10, fight_depth.bullet_outside, bone_obj);
				_bones[i].image_angle = 90;
				i++;
			}
			audio_play_sound_plugging(snd_emergence);
		}
		
		if (_time <= 10) {
			var i = 0;
			repeat (sum_num) {
				_bones[i].image_yscale += 0.1;
				i++;
			}
		}
		
		var period = 40 - _power*4;
		var shake_time = 10;
		if (_time % period == 0) {
			var rand_num;
			if (first_time) {
				rand_num = choose(5, 15, 25, 35);
				first_time = false;
			} else
			while (true) {
				rand_num = irandom_range(0, sum_num - 1);
				if (_bones[rand_num] != noone) break;
			}
			bone_moving = _bones[rand_num];
			_bones[rand_num] = noone;
			bone_moving.shake_time = shake_time;
		}
		
		if (_time % (period + shake_time - _power) == 0) {
			if (bone_moving.image_angle == 180) {
				bone_moving.speed = 4;
				bone_moving.direction = 270;
			}
			if (bone_moving.image_angle == 0) {
				bone_moving.speed = 4;
				bone_moving.direction = 90;
			}
			if (bone_moving.image_angle == 270) {
				bone_moving.speed = 4;
				bone_moving.direction = 0;
			}
			if (bone_moving.image_angle == 90) {
				bone_moving.speed = 4;
				bone_moving.direction = 180;
			}
			audio_play_sound_plugging(snd_spare_up);
		}

		if(_time > 320 + 20 * _power)
			instance_destroy();
		break;
		
	case 3: // Две кости (сверху, снизу)
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.orange); 

		if(_time % (55 - 4 * _power) == 1 && _time < (55 - 4 * _power) * (5 + _power)) {
			var side = irandom_range(0, 1);
			var bone_speed = 1.5 + 0.5*_power;
			var bone_size = 5.5;
			if (side == 0) {
				create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 0, 180);
				create_bone(_border.x + _border.right + 20, _border.y + _border.right + 20, bone_obj, bone_speed, bone_size, 180, 0);
			}
			else {
				create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 270, 270);
				create_bone(_border.x + _border.right + 20, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 90, 90);
			}
		}
		
		if(_time > (55 - 4 * _power) * (6 + _power)) { instance_destroy(); }
		break;
}