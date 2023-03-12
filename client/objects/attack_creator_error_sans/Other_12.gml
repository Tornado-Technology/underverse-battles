/// @description Gasterblasters
_time++;

_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0: // Наводящиеся гастербластеры
		
		// Create border
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left + 10, battle_border.right + 10);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		// Attack
		var period = 50 - _power * 5;
		var amount = 7 + _power;
		if (_time == 1)
			stage = irandom_range(1, 2);
		
		if (stage == 1) {
			if(_time % period == 1 && _time <= period * amount) {
				create_aiming_gasterblaster(aim_gb_obj, _soul);
			}
		}
		else {
			period = 54 - _power * 4;
			amount = 6 + _power;
			if(_time % period == 1 && _time <= period * amount) {
				repeat (2) { create_aiming_gasterblaster(aim_gb_obj, _soul); }
			}
		}
		
		if(_time == period * amount + 60) instance_destroy();
		break;
		
	case 1: //крестовые гастербластеры
		
		// Create border
		_border = battle_border_create(battle_border.up - 35, battle_border.down - 35, battle_border.left - 35, battle_border.right - 35); 
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		// Attack
		if(_time % (65 - _power * 6) == 1 and _time <= (65 - _power * 6) * (5 + _power)) {
			var _gb;
			var x_gb, y_gb;
			var gb_size = 60;
			var pos = irandom_range(0, 3);
			var con = room_height + gb_size;
			var rnd = irandom_range(-gb_size, con);
			
			repeat(2) {
				switch (pos) {
					case 0:
						x_gb = -gb_size;
						y_gb = rnd;
						break;
		
					case 1:
						x_gb = rnd;
						y_gb = con;
						break;
		
					case 2:
						x_gb = con;
						y_gb = rnd;
						break;
		
					case 3:
						x_gb = rnd;
						y_gb = -gb_size;
						break;
				}
				create_gasterblaster(obj_gasterblaster_error_sans, x_gb, y_gb, _border.x, _border.y, point_direction(x_gb, y_gb, _border.x, _border.y) + 90);
				pos = (pos + 1) % 4;
			}
		}
		
		if(_time == (65 - _power * 6) * (5 + _power) + 60) instance_destroy();
		break;
	
	case 2: // Платформы и гастербластеры
	
		// Create border
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		var sector_y_step = 30;
		var sector_y = _border.y - _border.up + 25;
		
		// Create soul
		var soul_offset = 5;
		var soul_position = choose(Vector2(_border.x + 12, sector_y - soul_offset), Vector2(_border.x - 38, sector_y + sector_y_step - soul_offset), Vector2(_border.x + 12, sector_y + sector_y_step * 2 - soul_offset));
		_soul = create_soul(soul_position.x, soul_position.y, battle_soul_type.blue);
		
		var main_speed = 0.5 + _power * 0.1
		create_moving_platforms(_border.x + _border.left + 40, sector_y, 4, 6, 60, -main_speed, 0);
		create_moving_platforms(_border.x - _border.right - 40, sector_y + sector_y_step, 4, 6, 60, main_speed, 1);
		create_moving_platforms(_border.x + _border.left + 40,  sector_y + sector_y_step * 2, 4, 6, 60, -main_speed, 2);
		
		// Platforms and bones
		if (_time == 1) {
			var i = 0; repeat(20) {
				create_bone(_border.x - _border.left + i * 8, _border.y + _border.down + 3, bone_obj, 0, 1, 0, 0);
				i++;
			}
		}
		
		// Attack
		repeat (_power == 5 ? 1 : 1) {
			var _gb_pos = irandom_range(0, 2);
			var border_dist = 180;
			if(_time % (65 - _power * 6) == 1 && _time <= (65 - _power * 6) * (5 + _power)) {
				switch (_gb_pos) {
					case 0:
						create_gasterblaster(gb_obj, _border.x + border_dist, sector_y - 5, _border.x, sector_y - 5,  270);
						break;
					case 1:
						create_gasterblaster(gb_obj, _border.x + border_dist, sector_y + sector_y_step - 5, _border.x, sector_y + sector_y_step - 5,  270);
						break;
					case 2:
						create_gasterblaster(gb_obj, _border.x + border_dist, sector_y + sector_y_step * 2 - 5, _border.x, sector_y + sector_y_step * 2 - 5,  270);
						break;
				}
			}
		}
		
		if(_time == (70 - _power * 6) * (5 + _power) + 60) { instance_destroy(); }
		break;
}