/// @desc Tea
switch (attack_num) {
	case 0:
		border_instance = battle_border_create(8, 64, battle_border.left, battle_border.right);

		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);

			instance_cup = instance_create_depth(border_instance.x, border_instance.y - border_instance.up - 32, 0, obj_cup_delta, {
				pow: _power + 2,
				floor_y: border_instance.y - border_instance.up,
				target_speed_max: 2,
				target_speed: 2,
				target_angle: 45,
				target_left: border_instance.x - border_instance.right + 20,
				target_right: border_instance.x + border_instance.left + 20,
				target_direction: dir.left
			});
			time_source_start(time_source_update_destroy_0_0);
		});
		time_source_start(time_source_border_delay);
		break;
		
	case 1:
		border_instance = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		
		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			soul_instance = create_soul(border_instance.x, border_instance.y - border_instance.up + 16, battle_soul_type.blue, fight_network_mode);

			instance_tea = instance_create_depth(border_instance.x, border_instance.y + border_instance.down, 0, obj_tea_delta, {
				image_xscale: round((border_instance.left + border_instance.right) / 32)
			});
		
			update_0_1(_power);
			time_source_start(time_source_update_0_1);
			time_source_start(time_source_update_destroy_0_1);
		});
		time_source_start(time_source_border_delay);
		break;
		
	case 2:
		border_instance = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);

		time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
			soul_instance = create_soul(border_instance.x, border_instance.y - 30, battle_soul_type.blue, fight_network_mode);
			//soul_instance.image_angle += 1;

			instance_tea = instance_create_depth(border_instance.x, border_instance.y + border_instance.down, 0, obj_tea_delta, {
				image_xscale: round((border_instance.left + border_instance.right) / 32)
			});
			
			update_0_2(_power);
			time_source_start(time_source_update_0_2);
			time_source_start(time_source_update_0_2_2);
			time_source_start(time_source_update_destroy_0_2);
		});
		time_source_start(time_source_border_delay);
		break;
}
