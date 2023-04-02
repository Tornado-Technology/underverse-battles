/// @description Error bones
if (started) exit;

switch (attack_num) {
	case 0:	// Падающие кости
		
		// Create border
		_border = battle_border_create(battle_border.up - 15, battle_border.down - 15, battle_border.left - 25, battle_border.right - 25);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		// Attack
		update_0_0();
		time_source_start(time_source_update_0_0);
		time_source_start(time_source_update_destroy_0_0);
		
		var i = 0;
		repeat (num) {
			if (_bones[i].image_yscale == 1)
				audio_play_sound_plugging(snd_emergence);
			if (_bones[i]._delay == 10 - _power and _bones[i].y == obj_battle_border.y - obj_battle_border.up - 20)
				audio_play_sound_plugging(snd_projectile);
			if (_bones[i].image_yscale < 2)
				_bones[i].image_yscale += 0.1;
			else if (_bones[i]._delay < 10 - _power)
				_bones[i]._delay++;
			else if (_bones[i].y < obj_battle_border.y + obj_battle_border.down - 10) {
				_bones[i]._hspd += 0.04 + _power * 0.02;
				_bones[i].y += _bones[i]._hspd;
			}
			else if (_bones[i]._falling_sound) {
				audio_play_sound_plugging(snd_projectile_hit);
				_bones[i]._falling_sound = false;
			}
			++i;
		}
		break;
		
	case 1: // Тыкающие кости
		
		// Create border
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		if (battle_border_start_animation_end()) exit;
	
		// Create soul
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		// Attack
		if(_time % (20 - 2 * _power) == 1 and _time < 240 + 20 * _power) {
			var coord = [];
			coord = rand_side_from(_border.x - _border.left - 40, _border.y - _border.up - 40, _border.x + _border.right + 40, _border.y + _border.down + 40);
			_bones[num] = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside, bone_obj);
			_bones[num].direction = point_direction(_bones[num].x, _bones[num].y, _border.x, _border.y);
			_bones[num].image_angle = _bones[num].direction - 90;
			_bones[num].image_yscale = 3.2;
			_bones[num].speed = 1.5 + 0.1 * _power;
			_bones[num]._delay = 0;
			_bones[num]._stage = 0;
			++num;
			audio_play_sound_plugging(snd_projectile);
		}
		var i = 0;
		repeat(num) {
			if (_bones[i]._stage == 0 and _bones[i].x > _border.x - _border.left and _bones[i].x < _border.x + _border.right and _bones[i].y > _border.y - _border.up and _bones[i].y < _border.y + _border.down) {
				_bones[i].speed = 0;
				_bones[i]._stage = 1;
			}
			if (_bones[i]._stage == 1 and _bones[i]._delay < 10)
				_bones[i]._delay++;
			if (_bones[i]._stage == 1 and _bones[i]._delay == 10)
				_bones[i]._stage = 2;
			if (_bones[i]._stage == 2) {
				_bones[i].speed = 3;
				_bones[i].direction -= 180;
				_bones[i]._stage = 3;
			}
			++i;
		}
			
		if(_time > 320 + 20 * _power)
			instance_destroy();
	break;
	case 2: // Две кости

		// Create border
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		if (_time == 1) {
			_side = irandom_range(0, 1);
		}
		
		// Attack
		var period =  58 - 4 * _power;
		var amount = 5 + _power;
		if(_time % period == 1 and _time < period * amount) {
			var bone_speed = 1.5 + 0.5*_power;
			var bone_size = 5.5;
			if (_side == 0) {
				_inst1 = create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 0, 180);
				_inst2 = create_bone(_border.x + _border.right + 20, _border.y + _border.right + 20, bone_obj, bone_speed, bone_size, 180, 0);
				_inst1.sprite_index = spr_bone_error_sans;
				_inst2.sprite_index = spr_bone_error_sans;
			}
			if (_side == 1) {
				_inst1 = create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 270, 270);
				_inst2 = create_bone(_border.x + _border.right + 20, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 90, 90);
				_inst1.sprite_index = spr_bone_error_sans;
				_inst2.sprite_index = spr_bone_error_sans;
			}
		}
		
		if(_time > period * (amount + 1)) {
			instance_destroy();
		}

	break;
	case 3: //платформы и падающие кости
		
		// Create border
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		// Attack
		var main_speed = 1 + _power * 0.2;
		create_moving_platforms(obj_battle_border.x - obj_battle_border.left - 40, obj_battle_border.y + 20, 2, 10, 120, main_speed, 0);
		create_moving_platforms(obj_battle_border.x + obj_battle_border.right + 40, obj_battle_border.y - 20, 2, 10, 120, -main_speed, 1);
		if(_time % (32 - 2 * _power) == 1 and _time < 250 + 20 * _power) {
			var i = 0;
			repeat (2) {
				var rand_place = irandom_range(0, 2);
				if (rand_place == 0) {
					if (i == 0)
						_bones[num] = instance_create_depth(_soul.x, obj_battle_border.y - obj_battle_border.up - 20, fight_depth.bullet_outside, bone_obj);
					else
						_bones[num] = instance_create_depth(_soul.x, obj_battle_border.y + obj_battle_border.down + 20, fight_depth.bullet_outside, bone_obj);
				}
				else {
					var rand_x = irandom_range(obj_battle_border.x - obj_battle_border.left, obj_battle_border.x + obj_battle_border.right);
					if (i == 0)
						_bones[num] = instance_create_depth(rand_x, obj_battle_border.y - obj_battle_border.up - 20, fight_depth.bullet_outside, bone_obj);
					else
						_bones[num] = instance_create_depth(rand_x, obj_battle_border.y + obj_battle_border.up + 20, fight_depth.bullet_outside, bone_obj);
				}
				if (i == 0)
					_bones[num].image_angle = 180;
				else
					_bones[num].image_angle = 0;
				_bones[num]._delay = 0;
				_bones[num]._hspd = 0;
				_bones[num]._falling_sound = true;
				++num;
				++i;
			}
		}
		var i = 0;
		repeat(num) {
			if (i % 2 == 0) {
				if (_bones[i].image_yscale == 1)
					audio_play_sound_plugging(snd_emergence);
				if (_bones[i]._delay == 10 - _power and _bones[i].y == obj_battle_border.y - obj_battle_border.up - 20)
					audio_play_sound_plugging(snd_projectile);
				if (_bones[i].image_yscale < 2)
					_bones[i].image_yscale += 0.1;
				else if (_bones[i]._delay < 10 - _power)
					_bones[i]._delay++;
				else if (_bones[i].y < obj_battle_border.y + obj_battle_border.down - 10 and _bones[i].can_move) {
					_bones[i]._hspd += 0.04 + _power * 0.02;
					_bones[i].y += _bones[i]._hspd;
				}
				else if (_bones[i]._falling_sound) {
					audio_play_sound_plugging(snd_projectile_hit);
					_bones[i]._falling_sound = false;
				}
			}
			else {
				if (_bones[i].image_yscale < 2)
					_bones[i].image_yscale += 0.1;
				else if (_bones[i]._delay < 10 - _power)
					_bones[i]._delay++;
				else if (_bones[i].y > obj_battle_border.y - obj_battle_border.up + 10 and _bones[i].can_move) {
					_bones[i]._hspd += 0.04 + _power * 0.02;
					_bones[i].y -= _bones[i]._hspd;
				}
			}
			++i;
		}
		
		if(_time > 280 + 20 * _power) instance_destroy();
		break;
}

started = true;