/// @desc Rotating bones
switch (attack_num) {
	case 0:	// Вращающиеся кости крестом с перемещением
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 10, battle_border.right - 10);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			create_soul(_border.x, _border.y, battle_soul_type.orange);
		
			rand_num = irandom_range(0, 3);
		
			update_1_0(_power);
			time_source_start(time_source_update_1_0);
			time_source_start(time_source_update_destroy_1_0);
		});
		time_source_start(time_source_border_delay);
		break;
	
	case 1:	// Вращающиеся кости крестом по центру
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			create_soul(_border.x - 30, _border.y - 30, battle_soul_type.orange);
		
			var bone_speed = 0;
			var bone_size = 8;
			var angle_speed = 1.2 + _power * 0.2;
			rand_num = irandom_range(0, 1);
			if (rand_num == 1) angle_speed = -angle_speed;
			_inst1 = create_bone_spinning(_border.x, _border.y, bone_spin_obj, bone_speed, 0, 0, 0, angle_speed);
			_inst2 = create_bone_spinning(_border.x, _border.y, bone_spin_obj, bone_speed, 0, 0, 90, angle_speed);
			_inst1.change_scale(bone_size, 0.1);
			_inst2.change_scale(bone_size, 0.1);
		
			update_1_1(_power);
			time_source_start(time_source_update_1_1);
			time_source_start(time_source_update_destroy_1_1);
		});
		time_source_start(time_source_border_delay);
		break;
	
	case 2:	// Вращающиеся кости с двух сторон с перемещением
		_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 10, battle_border.right - 10);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			create_soul(_border.x, _border.y, battle_soul_type.orange);
		
			update_1_2(_power);
			time_source_start(time_source_update_1_2);
			time_source_start(time_source_update_stop_1_2);
			time_source_start(time_source_update_destroy_1_2);
		});
		time_source_start(time_source_border_delay);
		break;
}