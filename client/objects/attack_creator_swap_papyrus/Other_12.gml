/// @desc Orange attack
_time++;

switch (attack_num) {
	case 0:
	if (_time == 1) {
		border_decrease = 25 + _power*3
		_border = battle_border_create(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
		if (battle_border_start_animation_end()) exit;
	
		_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
		_soul.changeable_direction = true;
	
		num = 12;
		switch (_power) {
			default:
			case 0:
				_period = 80;
				_time_step = 28;
				final_time = _period*5;
				break;
			case 1:
				_period = 70;
				_time_step = 25;
				final_time = _period*6;
				break;
			case 2:
				_period = 65;
				_time_step = 22;
				final_time = _period*7;
				break;
			case 3:
				_period = 60;
				_time_step = 18;
				final_time = _period*8;
				break;
			case 4:
				_period = 55;
				_time_step = 15;
				final_time = _period*10;
				break;
		}
		prev_side = 2;
		_time = _period;
	}

	if(_time % _period == 0) {
		side = irandom_range(0, 3);
		var i = 0;

		repeat(num) {
			if (i == 0)
				character_instance.prev_sprite = noone;
			if (side == 0) {
				_bones[i] = instance_create_depth(_border.x - _border.left + i * 10, _border.y - _border.up - 20, fight_depth.bullet_outside, bone_obj);
				_bones[i].image_angle = 180;
				if (i == 0) {
					_soul.side = 1;
					prev_side = 0;
				}
			}
			if (side == 1) {
				_bones[i] = instance_create_depth(_border.x - _border.left + i * 10, _border.y + _border.down + 20, fight_depth.bullet_outside, bone_obj);
				_bones[i].image_angle = 0;
				if (i == 0) {
					_soul.side = 2;
					prev_side = 1;
				}
			}
			if (side == 2) {
				_bones[i] = instance_create_depth(_border.x - _border.left - 20, _border.y - _border.up + i * 10, fight_depth.bullet_outside, bone_obj);
				_bones[i].image_angle = 270;
				if (i == 0) {
					_soul.side = 3;
					prev_side = 2;
				}
			}
			if (side == 3) {
				_bones[i] = instance_create_depth(_border.x + _border.right + 20, _border.y - _border.up + i * 10, fight_depth.bullet_outside, bone_obj);
				_bones[i].image_angle = 90;
				if (i == 0) {
					_soul.side = 4;
					prev_side = 3;
				}
			}
			++i;
		}
		audio_play_sound_plugging(snd_spare_up);
	}

	if(_time % _period >= 1 and _time % _period <= 3) {
		var i = 0;
		repeat(num) {
			_bones[i].image_yscale += 0.3;
			++i;
		}
	}
	if(_time % _period >= _time_step and _time % _period <= _time_step + 2) {
		var i = 0;
		repeat(num) {
			_bones[i].image_yscale -= 0.3;
			++i;
		}
	}
	if(_time % _period == _time_step + 2) {
		var i = 0;
		repeat(num) {
			instance_destroy(_bones[i]);
			_bones[i] = noone;
			++i;
		}
	}
	if (_time >= final_time - 1) {
		//character_instance.stop_hand_wave();
		instance_destroy();
	}
	break;
	
	case 1:
	if (_time == 1) {
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		if (battle_border_start_animation_end()) exit;
	
		_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
	
		num = 12;
		switch (_power) {
			default:
			case 0:
				_period = 80;
				_time_step = [30, 35, 60, 65];
				final_time = _period*5;
				break;
			case 1:
				_period = 70;
				_time_step = [30, 35, 60, 65];
				final_time = _period*6;
				break;
			case 2:
				_period = 65;
				_time_step = [25, 30, 55, 60];
				final_time = _period*6;
				break;
			case 3:
				_period = 60;
				_time_step = [20, 25, 50, 55];
				final_time = _period*7;
				break;
			case 4:
				_period = 55;
				_time_step = [15, 20, 45, 50];
				final_time = _period*10;
				break;
		}
		_time = _period;
	}

	if(_time % _period == 0) {
		side = choose(dir.up, dir.down, dir.left, dir.right);
		new_warning = true;
		var i = 0;

		repeat(num) {
			if (i == 0)
				character_instance.prev_sprite = noone;
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
		//character_instance.change_sprite_hand_dir(side);
	}

	bone_scale_speed = 0.65;

	if (attack_num == 0) {
		var warning_scale = 5;
		if(!_soul.blue_attack and new_warning) {
			draw_warning(side, warning_scale);
			audio_play_sound_plugging(snd_warning);
			new_warning = false;
		}
	}
	else {
		var warning_scale = 12;
		if(new_warning) {
			draw_warning(side, warning_scale);
			audio_play_sound_plugging(snd_warning);
			new_warning = false;
		}
	}

	if(_time % _period == _time_step[0]) {
		instance_destroy(obj_warning);
		audio_play_sound_plugging(snd_spare_up);
	}

	if(_time % _period >= _time_step[0] and _time % _period <= _time_step[1]) {
		var i = 0;
		repeat(num) {
			_bones[i].image_yscale += bone_scale_speed;
			++i;
		}
	}

	if(_time % _period >= _time_step[2] and _time % _period <= _time_step[3]) {
		var i = 0;
		repeat(num) {
			_bones[i].image_yscale -= bone_scale_speed;
			++i;
		}
	}

	if(_time % _period == _time_step[3]) {
		var i = 0;
		repeat(num) {
			instance_destroy(_bones[i]);
			_bones[i] = noone;
			++i;
		}
	}

	if (_time % final_time == 0) {
		//character_instance.stop_hand_wave();
		instance_destroy();
	}
	break;
}