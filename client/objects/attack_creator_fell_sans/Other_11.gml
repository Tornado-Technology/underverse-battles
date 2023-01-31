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
		var i;
		if (_power > 0) i = 2;
		else i = 1;
		
		if(_time % (65 - _power * 6) == 1 && _time <= (65 - _power * 6) * (5 + _power)) {
			var _gb;
			var x_gb, y_gb;
			var gb_size = 60;
			var pos = irandom_range(0, 3);
			var con = room_height + gb_size;
			var rnd = irandom_range(-gb_size, con);
			
			repeat(i) {
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
	case 2: // Гастербластеры сверху
	
		// Create border
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left - 42, battle_border.right - 42);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(_border.x, _border.y + _border.down - 9, battle_soul_type.blue);
		
		var period = 65 - _power % 5 * 6;
		
		repeat (_power == 5 ? 2 : 1) {
			var _gb_pos = irandom_range(0, 2);
			var border_dist = 100;
			if(_time % period == 1 && _time <= period * (5 + _power)) {
				switch (_gb_pos) {
					case 0:
						create_gasterblaster(gb_obj, _border.x + 20, _border.y - _border.up - border_dist, _border.x + 20, _border.y, 0);
						break;
					case 1:
						create_gasterblaster(gb_obj, _border.x, _border.y - _border.up - border_dist, _border.x, _border.y, 0);
						break;
					case 2:
						create_gasterblaster(gb_obj, _border.x - 20, _border.y - _border.up - border_dist, _border.x - 20, _border.y, 0);
						break;
				}
			}
		}
		
		//Дополнительная кость
		if (_power >= 2) {
			if(_time % period == 30) {
				var _inst = instance_create_depth(_border.x - _border.left - 10, _border.y + _border.down + 5, fight_depth.bullet_outside, bone_obj);
				_inst._speed = 1.8;
				_inst.image_xscale = 1.4;
			}
		}
		
		if (_time == period * (5 + _power) + 60)
			instance_destroy();
		break;
}