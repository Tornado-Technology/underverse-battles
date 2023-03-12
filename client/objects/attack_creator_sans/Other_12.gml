/// @desc Blue attack
_time++;

if (_time == 1) {
	_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
	if (battle_border_start_animation_end()) exit;
	
	if (attack_num == 0)
		_soul = create_soul(_border.x, _border.y, battle_soul_type.blue);
	else
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
	
	num = 12;
	switch (_power) {
		default:
		case 0:
			_period = 75;
			_time_step = [30, 35, 60, 65];
			final_time = _period*5;
			break;
		case 1:
			_period = 70;
			_time_step = [30, 35, 60, 65];
			final_time = _period*6;
			break;
		case 2:
			_period = 66;
			_time_step = [25, 30, 55, 60];
			final_time = _period*6;
			break;
		case 3:
			_period = 62;
			_time_step = [20, 25, 50, 55];
			final_time = _period*7;
			break;
		case 4:
			_period = 58;
			if (attack_num == 0) _time_step = [18, 22, 40, 44];
			if (attack_num == 1) _time_step = [15, 20, 45, 50];
			final_time = _period*10;
			break;
	}
	_time = _period;
}

if(_time % _period == 0) {
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

bone_scale_speed = _power > 2 ? 0.2 : 0.3;
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
	var warning_scale = _power > 2 ? 10 : 12;
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
	instance_destroy();
}