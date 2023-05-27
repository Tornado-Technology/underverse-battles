/// @description Turbo blaster
_power = (_power == 4) ? 5 : _power;

switch (attack_num) {
	case 0: // Турбо бластер следует за душой
		var rand_border = irandom_range(0, 2);
		_border = battle_border_create(battle_border.up - 15, battle_border.down - 15, battle_border.left - 15, battle_border.right - 15);
		if (rand_border == 1)
			_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left - 30, battle_border.right - 30);
		if (rand_border == 2)
			_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left, battle_border.right);
			
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
			var period = 50 - _power * 5;
			var gb_size = 60;
			var con = room_height + gb_size;
			var coord = rand_side_from(-gb_size, -gb_size, con, con);
			inst_turboblaster = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, gb_aim_obj, {
				target_time: (period - 10) / 60,
				charge_time: period / 60,
				destroy_time: 15 / 60
			});
		
			update_2_0();
			time_source_start(time_source_update_2_0);
			time_source_start(time_source_update_destroy_2_0);
		});
		time_source_start(time_source_border_delay);
		
		break;
		
	case 1: // Турбо бластер сверху
		_border = battle_border_create(battle_border.up - 65, battle_border.down - 65, battle_border.left - 50, battle_border.right - 50);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
			var border_dist = 180;
			var period = 50 - _power * 5;
			var rand_pos = irandom_range(0, 2);
			var gb_x = _border.x - 12;
			if (rand_pos == 1) gb_x = _border.x;
			if (rand_pos == 2) gb_x = _border.x + 12;
			var gb_x = _border.x - 12;
			inst_turboblaster = create_gasterblaster(gb_obj, gb_x, _border.y - border_dist, gb_x, _border.y - _border.up - 10,  0, {
				target_time: (period - 10) / 60,
				charge_time: period / 60,
				destroy_time: 15 / 60
			});
		
			time_source_start(time_source_update_2_1);
			time_source_start(time_source_update_destroy_2_1);
		});
		time_source_start(time_source_border_delay);
		
		break;
}