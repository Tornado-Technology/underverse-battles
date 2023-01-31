/// @desc Gasterblasters
_time++;

_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0: // Наводящиеся гастербластеры
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		var period = 65 - _power * 5;
		var ammount = 4 + _power;
		if(_time % period == 1 and _time <= period * ammount) {
			repeat (_power > 3 ? 2 : 1) { create_aiming_gasterblaster(obj_gasterblaster_aiming_ink_sans, _soul); }
		}
		
		if(_time == period * ammount + 60) { instance_destroy(); }
	break;
	
	case 1: // Крестовые гастербластеры
		
		// Create border
		_border = battle_border_create(battle_border.up - 40, battle_border.down - 40, battle_border.left - 40, battle_border.right - 40);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		// Attack
		var period = 65 - _power * 4;
		var ammount = 4 + _power;
		if(_time % period == 1 && _time <= period * ammount) {
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
		
		if (_time == period * ammount + 60)
			instance_destroy();
		break;
}