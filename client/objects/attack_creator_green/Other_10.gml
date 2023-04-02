/// @description Bones and Spikes
_time++;

switch (attack_num) {
	case 0:	// Кости и шипы со всех сторон
		
		// Create border
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		// Attack
		if (_time % 20 == 1 || _time % 25 == 0) {
			var coord = rand_side_from(_border.x - _border.left - 20, _border.y - _border.up - 20, _border.x + _border.right + 20, _border.y + _border.down + 20);
			if (_time % 20 == 1) {
				var spear_direction = point_direction(coord[0], coord[1], _soul.x, _soul.y);
				instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, spike_obj, {
					speed: 2 + _power * 0.2,
					direction: spear_direction,
					image_angle: spear_direction
				});
				audio_play_sound_plugging(snd_projectile);
			}
			if (_time % 25 == 0) {
				var bone_direction = point_direction(coord[0], coord[1], _soul.x, _soul.y);
				create_bone(coord[0], coord[1], bone_obj, 2 + _power * 0.2, 1, bone_direction, bone_direction - 90);
				audio_play_sound_plugging(snd_projectile);
			}
		}

		if (_time > 320 + 20 * _power) { instance_destroy(); }
		break;
		
	case 1:	// Парные шипы
		
		// Create border
		_border = battle_border_create(battle_border.up - 25, battle_border.down - 25, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		// Attack
		var period = 22 - _power * 3;
		if (_time % period == 1) {
			var side = irandom_range(0, 1);
			var x_rand;
			var spear_direction = 0;
			if (side == 0) {
				x_rand = _border.x - _border.left - 10;
				spear_direction = 0;
			}
			else {
				x_rand = _border.x + _border.right + 10;
				spear_direction = 180;
			}
			var y_rand = irandom_range(_border.y - _border.up, _border.y + _border.down - 10);
			instance_create_depth(x_rand, y_rand, fight_depth.bullet_outside_hight, spike_obj, {
				speed: 2 + _power * 0.2,
				direction: spear_direction,
				image_angle: spear_direction
			});
			instance_create_depth(x_rand, y_rand + 10, fight_depth.bullet_outside_hight, spike_obj, {
				speed: 2 + _power * 0.2,
				direction: spear_direction,
				image_angle: spear_direction
			});
			audio_play_sound_plugging(snd_projectile);
		}
		
		if (_time > 340 + 20 * _power) instance_destroy();
		break;
		
	case 2:	// Двигающаяся арена
		border_decrease = 40;
		_border = battle_border_create(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.red);
		
		num = 7;
		var sum_num = num * 4;
		if (_time == 1) {
			x_start = _border.x;
			y_start = _border.y;
			
			var i = 0;
			repeat (sum_num) {
				
				// Up
				var x_spike = _border.x - _border.left + i * 10;
				var y_spike = _border.y - _border.up;
				var angle_spike = 270;
				var speed_spike = 1;
				// Right
				if (i >= num * 3) {
					x_spike = _border.x + _border.right;
					y_spike = _border.y - _border.up + (i - 3*num) * 10;
					angle_spike = 180;
				}
				// Left
				else if (i >= num * 2) {
					x_spike = _border.x - _border.left;
					y_spike = _border.y + _border.down - (i - 2*num) * 10;
					angle_spike = 0;
				}
				// Down
				else if (i >= num) {
					x_spike = _border.x + _border.right - (i - num) * 10;
					y_spike = _border.y + _border.down;
					angle_spike = 90;
				}
				
				_bones[i] = instance_create_depth(x_spike, y_spike, fight_depth.bullet_outside, spike_obj);
				_bones[i].speed = speed_spike;
				_bones[i].image_angle = angle_spike;
				_bones[i].direction = angle_spike;
				i++;
			}
			audio_play_sound_plugging(snd_emergence);
		}
		
		if (_time == 10) {
			_border.speed = 1 + _power * 0.1;
			_border.direction = irandom_range(0, 359);
			var i = 0;
			repeat (sum_num) {
				_bones[i].speed = _border.speed;
				_bones[i].direction = _border.direction;
				i++;
			}
		}
		
		if (_time > 10) {
			var shift_max = 25 + (_power * 2);
			var change_direction = false
			if (_border.x < x_start - shift_max || _border.x > x_start + shift_max) {
				_border.direction = 180 - _border.direction;
				change_direction = true;
			}
			
			if (_border.y < y_start - shift_max || _border.y > y_start + shift_max) {
				_border.direction = - _border.direction;
				change_direction = true;
			}
			
			if (change_direction) {
				var i = 0;
				repeat (sum_num) {
					_bones[i].direction = _border.direction;
					i++;
				}
			}
		}
		
		if (_time > 300 + 25 * _power) instance_destroy();
		break;
	
	case 3:	// Тыкающие кости справа и слева
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left - 45, battle_border.right - 45);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.red);
		
		var period = 25 - _power * 2;
		if (_time % period == 1) {
			var rand_side = irandom_range(0, 1);
			var bone_x = _border.x - _border.left - 40;
			var bone_direction = 270;
			if (rand_side == 1) {
				bone_x = _border.x + _border.right + 40;
				bone_direction = 90;
			}
			var bone_y = irandom_range(_border.y - _border.up + 5, _border.y + _border.down - 5);
			var bone_speed = 2 + _power * 0.1;
			_bones[num] = create_bone(bone_x, bone_y, bone_obj, bone_speed, 2, bone_direction + 90, bone_direction);
			_bones[num]._delay = 0;
			_bones[num]._stage = 0;
			num++;
			audio_play_sound_plugging(snd_projectile);
		}
		
		var i = 0;
		repeat(num) {
			if (_bones[i]._stage == 0 and _bones[i].x > _border.x - _border.left - 3 and _bones[i].x < _border.x + _border.right + 3) {
				_bones[i].speed = 0;
				_bones[i]._stage = 1;
			}
			if (_bones[i]._stage == 1 and _bones[i]._delay < 10)
				_bones[i]._delay++;
			if (_bones[i]._stage == 1 and _bones[i]._delay == 10)
				_bones[i]._stage = 2;
			if (_bones[i]._stage == 2) {
				_bones[i].speed = 2 + _power * 0.1;
				_bones[i].direction -= 180;
				_bones[i]._stage = 3;
			}
			++i;
		}
		
		if (_time > 320 + 20 * _power) instance_destroy();
		break;
}