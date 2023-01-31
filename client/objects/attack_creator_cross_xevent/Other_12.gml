/// @desc Gasterblasters
_time++;

_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0: // Наводящиеся гастербластеры
		
		// Create border
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		// Attack
		if(_time % (65 - _power * 6) == 1 && _time <= (65 - _power * 6) * (5 + _power)) {
			repeat (_power > 2 ? 2 : 1) { create_aiming_gasterblaster(aim_gb_obj, _soul); }
		}
		
		if(_time == (65 - _power * 6) * (5 + _power) + 60) instance_destroy();
		break;
	
	case 1: // Крестовые гастербластеры
		
		// Create border
		_border = battle_border_create(battle_border.up - 40, battle_border.down - 40, battle_border.left - 40, battle_border.right - 40);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		// Attack
		if(_time % (65 - _power * 6) == 1 && _time <= (65 - _power * 6) * (5 + _power)) {
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
				create_gasterblaster(gb_obj, x_gb, y_gb, _border.x, _border.y, point_direction(x_gb, y_gb, _border.x, _border.y) + 90);
				pos = (pos + 1) % 4;
			}
		}
		
		if (_time == (65 - _power * 6) * (5 + _power) + 60)
			instance_destroy();
		break;
	case 2: // Платформы и гастербластеры
	
		// Create border
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		var _soul_pos = irandom_range(0, 2);
		
		if (_soul_pos == 0)
			_soul = create_soul(_border.x, _border.y + 30, battle_soul_type.blue);
		if (_soul_pos == 1)
			_soul = create_soul(_border.x, _border.y, battle_soul_type.blue);
		if (_soul_pos == 2)
			_soul = create_soul(_border.x, _border.y - _border.up + 10, battle_soul_type.blue);
		
		// Attack
		var main_speed = 0.5 + _power * 0.1
		create_moving_platforms(_border.x - _border.left - 40, _border.y - 15, 4, 6, 60, main_speed, 0);
		create_moving_platforms(_border.x + _border.right + 40, _border.y + 15, 4, 6, 60, -main_speed, 1);
		
		repeat (_power == 5 ? 1 : 1) {
			var _gb_pos = irandom_range(0, 2);
			var border_dist = 180;
			if(_time % (65 - _power * 6) == 1 && _time <= (65 - _power * 6) * (5 + _power)) {
				switch (_gb_pos) {
					case 0:
						create_gasterblaster(gb_obj, _border.x + border_dist, _border.y + 35, _border.x, _border.y + 30,  270);
						break;
					case 1:
						create_gasterblaster(gb_obj, _border.x + border_dist, _border.y + 5, _border.x, _border.y,  270);
						break;
					case 2:
						create_gasterblaster(gb_obj, _border.x + border_dist, _border.y - 25, _border.x, _border.y - 30,  270);
						break;
				}
			}
		}
		
		if(_time == (65 - _power * 6) * (5 + _power) + 60) { instance_destroy(); }
		break;
}