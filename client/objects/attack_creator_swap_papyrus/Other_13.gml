/// @desc Bad time
_time++;

if (_time == 1) {
	border_decrease = 20;
	_border = battle_border_create(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
	if (battle_border_start_animation_end()) exit;
	
	_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
	_soul.changeable_direction = true;
}

// Orange attack
if (stage == 0 || stage == 2) {
	switch (attack_num) {
		case 0:
		if (_time == 1) {
		
			if (stage == 2) {
				_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.orange);
				_soul.changeable_direction = true;
			}
	
			num = 12;
			_period = 60;
			_time_step = 18;
			_amount = 3;
			final_time = _period * _amount + 30;
			prev_side = 2;
			_time = _period;
		}

		if(_time % _period == 0 && _time <= _period * _amount) {
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
			//character_instance.change_sprite_hand_dir(side);
			audio_play_sound_plugging(snd_spare_up);
		}

		if(_time % _period >= 1 and _time % _period <= 3) {
			var i = 0;
			repeat(num) {
				_bones[i].image_yscale += 0.55;
				++i;
			}
		}
		if(_time % _period >= _time_step and _time % _period <= _time_step + 2) {
			var i = 0;
			repeat(num) {
				_bones[i].image_yscale -= 0.55;
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
		if (_time >= final_time) {
			//character_instance.stop_hand_wave();
			_time = 0;
			stage++;
		}
		break;
	
		case 1:
		if (_time == 1) {
			if (stage == 2) {
				_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.orange);
				_soul.changeable_direction = true;
			}
	
			num = 12;
			_period = 60;
			_time_step = [20, 25, 50, 55];
			_amount = 3;
			final_time = _period*3 + _time_step[3];
			_time = _period;
		}

		if(_time % _period == 0 && _time <= _period * _amount) {
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

		bone_scale_speed = 0.64;

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

		if (_time >= final_time) {
			//character_instance.stop_hand_wave();
			_time = 0;
			stage++;
		}
	}
}

if (stage == 1) {
		
	// Attack
	if (_time == 1)
		_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
		
	var _bone = bone_obj;
	var rand_side = irandom_range(0, 7);
	var rand_bone_type = irandom_range(0, 1);
	if (rand_bone_type == 0)
		_bone = bone_orange_obj;
	
	var period = 30;
	var amount = 4;
	if(_time % period == 1 and _time < period * amount) {
		var rand_speed = 2 + random_range(0, 0.2);
		var max_size = 6.1;
		var rand_size = rand_bone_type == 0 ? max_size : random_range(2, 4);
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
		
	if(_time >= period * amount + 30) {
		stage++;
		_time = 0;
	}
}

// Gasterblasters
if (stage == 3) {
	if (_time == 1) {
		_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
		
		_angle = choose(0, 90, 180, -90);
		angle_step = 10;
	}
	
	var period = 5;
	var amount = 360 / angle_step * 3;
	if(_time % period == 1 && _time < period * amount) {
		var radius = _border.up * 2;
		var x_gb = _border.x + radius * cos(degtorad(_angle));
		var y_gb = _border.y + radius * sin(degtorad(_angle));
		create_gasterblaster(gb_obj, x_gb, y_gb, _border.x, _border.y, point_direction(x_gb, y_gb, _border.x, _border.y) + 90);
		_angle -= angle_step;
	}
	if (_time == period * amount / 2) {
		angle_step = 15;
	}
	
	if (_time >= period * amount + 60)
		instance_destroy();
}