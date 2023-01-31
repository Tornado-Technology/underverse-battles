/// @description Turbo blaster
_time++;

_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0: // турбо бластер следует за душой
		
		// Create border
		var rand_border = irandom_range(0, 2);
		_border = battle_border_create(battle_border.up - 15, battle_border.down - 15, battle_border.left - 15, battle_border.right - 15);
		if (rand_border == 1)
			_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left - 30, battle_border.right - 30);
		if (rand_border == 2)
			_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);

		// Attack
		var period = 65 - _power * 5;
		var ammount = (5 + _power);
		if (_time % period == 1 && _time <= period * ammount) {
			var coord_new = rand_side_from(_border.x - _border.left, _border.y - _border.up, _border.x + _border.right, _border.y + _border.down);
			
			if (inst_turboblaster == noone) {
				var gb_size = 60;
				var con = room_height + gb_size;
				var coord = rand_side_from(-gb_size, -gb_size, con, con);
				inst_turboblaster = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, gb_aim_obj);
				inst_turboblaster.shoot_time = period;
				inst_turboblaster.charge_time = period - 20;
			}
			inst_turboblaster.x_new = coord_new[0];
			inst_turboblaster.y_new = coord_new[1];
			inst_turboblaster.target = _soul;
		}
		
		if(_time == period * (ammount + 1)) instance_destroy();
		break;
		
	case 1: // турбо бластер сверху
		// Create border
		_border = battle_border_create(battle_border.up - 65, battle_border.down - 65, battle_border.left - 50, battle_border.right - 50);
		if (battle_border_start_animation_end()) exit;
		
		// Create soul
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		var period = 65 - _power * 5;
		var ammount = (5 + _power);
		if (_time % period == 1 && _time <= period * ammount) {
			var border_dist = 180;
			var rand_pos = irandom_range(0, 2)
			var gb_x = _border.x - 12;
			if (rand_pos == 1) gb_x = _border.x;
			if (rand_pos == 2) gb_x = _border.x + 12;
			if (inst_turboblaster == noone) {
				inst_turboblaster = create_gasterblaster(gb_obj, gb_x, _border.y - border_dist, gb_x, _border.y - _border.up - 10,  0);
				inst_turboblaster.shoot_time = period;
				inst_turboblaster.charge_time = period - 20;
			}
			else
				inst_turboblaster.x_dir = gb_x;
		}
		
		if(_time == period * (ammount + 1)) instance_destroy();
		break;
}