/// @desc Great time
_time++;

_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
if (battle_border_start_animation_end()) exit;

_soul = create_soul(_border.x, _border.y, battle_soul_type.red);

// Blue attack
if (stage == 1) {
	
	if (_time == 1) {
		if (attack_num == 0)
			_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.blue);
		else
			_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
		
		num = 4;
		_period = 60;
		_time_step_end = 100;
		final_time = _period * 4 - 10;
		prev_side = 2;
		_time = _period;
	}

	if(_time % _period == 0) {
		var side = choose(dir.up, dir.down, dir.left, dir.right);
		new_warning = true;
		if (attack_num == 0) {
			_soul.gravity_force = side;
			_soul.max_fly_time = 60;
			_soul.fly_time = _soul.max_fly_time;
			_soul.blue_attack = true;
			_soul.addit_spd = 5;
		}
	
		_bones[0] = instance_create_depth(_border.x + _border.right + 10, _border.y - _border.up - 15, fight_depth.bullet_outside, bone_obj);
		_bones[0].image_angle = 180;
		_bones[0].direction = 180;
		_bones[1] = instance_create_depth(_border.x - _border.left - 10, _border.y + _border.down + 15, fight_depth.bullet_outside, bone_obj);
		_bones[1].image_angle = 0;
		_bones[1].direction = 0;
		_bones[2] = instance_create_depth(_border.x - _border.left - 15, _border.y - _border.up - 10, fight_depth.bullet_outside, bone_obj);
		_bones[2].image_angle = 270;
		_bones[2].direction = 270;
		_bones[3] = instance_create_depth(_border.x + _border.right + 15, _border.y + _border.down + 10, fight_depth.bullet_outside, bone_obj);
		_bones[3].image_angle = 90;
		_bones[3].direction = 90;
		
		if (attack_num == 0) {
			var bone_scale = 1.9;
			var i = 0;
			repeat(num) {
				_bones[i].image_yscale = bone_scale;
				_bones[i].speed = 2;
				++i;
			}
		}
		else
		{
			var bone_scale = 4.6;
			var rand_side = irandom_range(0, 3);
			_bones[rand_side].image_yscale = bone_scale;
			_bones[rand_side].speed = 1.3;
		}
	
		character_instance.change_sprite_hand_dir(side);
	}

	if(_time % _period == _time_step_end) {
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
if (stage == 0 || stage == 2) {
	
	if (stage == 2) {
		if (_time == 1) {
			_soul = change_soul(_soul, _soul.x, _soul.y, battle_soul_type.red);
		}
	}
	
	var period = 24;
	var amount = 6;
	if(_time % period == 1 && _time < amount * period) {
		var side = irandom_range(0, 1);
		var _inst;
			
		if (side == 0) {
			_inst = instance_create_depth(_border.x - _border.left - 10, _soul.y, fight_depth.bullet_outside, spin_bone_obj);
			_inst._speed = 3.4;
			_inst._angle = 0;
		} else {
			_inst = instance_create_depth(_border.x + _border.right + 10, _soul.y, fight_depth.bullet_outside, spin_bone_obj);
			_inst._speed = 3.4;
			_inst._angle = 180;
		}
		audio_play_sound_plugging(snd_projectile);
	}
		
	if(_time > amount * period) {
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
	var amount = 360 / angle_step * 2;
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