/// @desc Damage wave
_time++;

_power = (_power == 4) ? 5 : _power;

va_x1_ = obj_camera.camera_position.x;
va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
va_y1_ = obj_camera.camera_position.y;
va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;

var wave_count = (70 - _power * 10) * (6 + _power);
var wave_speed = 3.2 + _power * 0.2;
var wave_last_time = convert_seconds_to_steps(1.5);

switch (attack_num) {
	case 0: // Волна урона в сторону души
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;

		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		if (_time % (62 - _power * 8) == 1 and _time <= wave_count) {
			repeat(2) {
				var coord = [];
				coord = rand_side_from(va_x1_ - 40, va_y1_ - 40, va_x2_ + 40, va_y2_ + 40);
				_wave = instance_create_depth(coord[0], coord[1], 0, obj_damage_wave_xchara);
			
				var _shift_x = irandom_range(-8 - _power, 8 + _power);
				var _shift_y = irandom_range(-8 - _power, 8 + _power);
			
				_wave._target_angle = point_direction(_wave.x, _wave.y, _soul.x + _shift_x, _soul.y + _shift_y);
				_wave._speed = wave_speed;
			}
		}
		
		if (_time == wave_count + wave_last_time)
			instance_destroy(); 
		
	break;
	
	case 1: //волна урона в сторону центра
		
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;

		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		if(_time % (62 - _power * 8) == 1 and _time <= wave_count) {
			repeat(3) {
				var coord = [];
				coord = rand_side_from(va_x1_ - 40, va_y1_ - 40, va_x2_ + 40, va_y2_ + 40);
				_wave = instance_create_depth(coord[0], coord[1], 0, obj_damage_wave_xchara);
				var _shift_x = irandom_range(-8 - _power, 8 + _power);
				var _shift_y = irandom_range(-8 - _power, 8 + _power);
				_wave._target_angle = point_direction(_wave.x, _wave.y, _border.x + _shift_x, _border.y + _shift_y);
				_wave._speed = wave_speed;
			}
		}
		
		if(_time == wave_count + wave_last_time)
			instance_destroy();
	break;
	
	case 2: //волна урона с предсказанием
		
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;

		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		var num = 4 + round(_power/2);
		if(_time % (110 - _power * 10) == 1 and _time <= (110 - _power * 10) * 3) {
			var i = 0;
			repeat(num) {
				coord_wave[i] = rand_side_from(va_x1_ - 40, va_y1_ - 40, va_x2_ + 40, va_y2_ + 40);
				zone_[i] = instance_create_depth(coord_wave[i, 0], coord_wave[i, 1], fight_depth.bullet_outside_hight, obj_zone_damage_wave);
				zone_[i].x_side = _soul.x;
				zone_[i].y_side = _soul.y;
				zone_[i].show_zone = true;
				i++;
			}
			audio_play_sound_plugging(snd_warning);
		}
		
		if(_time % (110 - _power * 10) == 30 and _time <= (110 - _power * 10) * 3) {
			var i = 0;
			repeat(num) {
				_wave = instance_create_depth(coord_wave[i, 0], coord_wave[i, 1], 0, obj_damage_wave_xchara);
				_wave._target_angle = point_direction(_wave.x, _wave.y, zone_[i].x_side, zone_[i].y_side);
				_wave._speed = wave_speed*1.4;
				instance_destroy(zone_[i]);
				i++;
			}
		}
		
		if(_time == (110 - _power * 10) * 3 + 40)
			instance_destroy();
	break;
}