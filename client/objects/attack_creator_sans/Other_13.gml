/// @desc Bad time
_time++;

_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
if (battle_border_start_animation_end()) exit;

if (attack_num == 0)
	_soul = create_soul(_border.x, _border.y, battle_soul_type.blue);
else
	_soul = create_soul(_border.x, _border.y, battle_soul_type.red);

// Blue attack
if (stage == 0 || stage == 2) {
		
	if (stage == 2 && _time == 1) {
		if (attack_num == 0)
			_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.blue);
		else
			_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
	}
	
	if (_time == 1) {
		num = 12;
		_period = 62;
		_time_step = [20, 25, 50, 55];
		final_time = _period * 3;
	}

	if(_time % _period == 1) {
		side = choose(dir.up, dir.down, dir.left, dir.right);
		new_warning = true;
		if (attack_num == 0) {
			_soul.gravity_force = side;
			_soul.max_fly_time = 60;
			_soul.fly_time = _soul.max_fly_time;
			_soul.blue_attack = true;
			_soul.addit_spd = 5;
		}
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
		character_instance.change_sprite_hand_dir(side);
	}

	bone_scale_speed = 0.3;
	if (attack_num == 1) bone_scale_speed = 0.64;

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
		character_instance.stop_hand_wave();
		_time = 0;
		stage++;
	}
}

// Bones
if (stage == 1) {

	if (_time == 1) {
		_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
		_side = irandom_range(0, 1);
	}
	
	var period = 45;
	var amount = 4;
	if(_time % period == 1 && _time < period * amount) {
		var bone_speed = 1.8;
		var bone_size = 4.3;
		if (_side == 0) {
			create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 0, 180);
			create_bone(_border.x + _border.right + 20, _border.y + _border.right + 20, bone_obj, bone_speed, bone_size, 180, 0);
		}
		if (_side == 1) {
			create_bone(_border.x - _border.left - 20, _border.y - _border.up - 20, bone_obj, bone_speed, bone_size, 270, 270);
			create_bone(_border.x + _border.right + 20, _border.y + _border.down + 20, bone_obj, bone_speed, bone_size, 90, 90);
		}
	}
		
	if (_time > period * (amount + 1)) {
		_time = 0;
		stage++;
	}
}

// Gasterblasters
if (stage == 3) {
	if (_time == 1) {
		_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
		
		_angle = choose(0, 90, -180, -90);
		angle_step = 10;
	}
	
	var period = 5;
	var amount = 360 / angle_step * 3;
	if(_time % period == 1 && _time < period * amount) {
		var radius = _border.up * 2;
		var x_gb = _border.x + radius * cos(degtorad(_angle));
		var y_gb = _border.y + radius * sin(degtorad(_angle));
		create_gasterblaster(gb_obj, x_gb, y_gb, _border.x, _border.y, point_direction(x_gb, y_gb, _border.x, _border.y) + 90);
		_angle += angle_step;
	}
	if (_time == period * amount / 2) {
		angle_step = 15;
	}
	
	if (_time >= period * amount + 60)
		instance_destroy();
}