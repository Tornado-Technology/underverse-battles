/// @desc Blue attack
_time++;

if (_time == 1) {
	_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
	if (battle_border_start_animation_end()) exit;
	
	if (attack_num = 0)
		_soul = create_soul(_border.x, _border.y, battle_soul_type.blue);
	else
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
	
	num = 4;
	switch (_power) {
		default:
		case 0:
			_period = 80;
			_time_step_end = 80;
			final_time = _period*5;
			break;
		case 1:
			_period = 70;
			_time_step_end = 90;
			final_time = _period*6;
			break;
		case 2:
			_period = 65;
			_time_step_end = 95;
			final_time = _period*6;
			break;
		case 3:
			_period = 60;
			_time_step_end = 100;
			final_time = _period*7;
			break;
		case 4:
			_period = 55;
			_time_step_end = 105;
			final_time = _period*10;
			break;
	}
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
			_bones[i].speed = 1.7 + _power * 0.1;
			++i;
		}
	}
	else
	{
		var bone_scale = 4.6;
		var rand_side = irandom_range(0, 3);
		_bones[rand_side].image_yscale = bone_scale;
		_bones[rand_side].speed = 1.8 + _power * 0.1;
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
	instance_destroy();
}