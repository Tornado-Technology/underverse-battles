/// @description Bones and Spikes
if (started) exit;

switch (attack_num) {
	case 0:	// Кости и шипы со всех сторон
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		update_0_0_2(_power);
		time_source_start(time_source_update_0_0);
		time_source_start(time_source_update_0_0_2);
		time_source_start(time_source_update_destroy_0_0);
		break;
		
	case 1:	// Парные шипы
		_border = battle_border_create(battle_border.up - 25, battle_border.down - 25, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;

		_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
		update_0_1(_power);
		time_source_start(time_source_update_0_1);
		time_source_start(time_source_update_destroy_0_1);
		break;
		
	case 2:	// Двигающаяся арена
		border_decrease = 40;
		_border = battle_border_create(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.red);
		
		num = 7;
		sum_num = num * 4;
		x_start = _border.x;
		y_start = _border.y;
			
		var i = 0;
		repeat (sum_num) {
			// Up
			var x_spike = _border.x - _border.left + i * 10;
			var y_spike = _border.y - _border.up;
			var angle_spike = 270;
			var speed_spike = 1;
			// Right
			if (i >= num * 3) {
				x_spike = _border.x + _border.right;
				y_spike = _border.y - _border.up + (i - 3*num) * 10;
				angle_spike = 180;
			}
			// Left
			else if (i >= num * 2) {
				x_spike = _border.x - _border.left;
				y_spike = _border.y + _border.down - (i - 2*num) * 10;
				angle_spike = 0;
			}
			// Down
			else if (i >= num) {
				x_spike = _border.x + _border.right - (i - num) * 10;
				y_spike = _border.y + _border.down;
				angle_spike = 90;
			}
				
			_bones[i] = instance_create_depth(x_spike, y_spike, fight_depth.bullet_outside, spike_obj);
			_bones[i].speed_const = speed_spike;
			_bones[i].image_angle = angle_spike;
			_bones[i].direction = angle_spike;
			i++;
		}
		audio_play_sound_plugging(snd_emergence);
		
		time_source_start(time_source_update_0_2);
		time_source_start(time_source_update_destroy_0_2);
		break;
	
	case 3:	// Тыкающие кости справа и слева
		_border = battle_border_create(battle_border.up - 30, battle_border.down - 30, battle_border.left - 45, battle_border.right - 45);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.red);
		
		update_0_3(_power);
		time_source_start(time_source_update_0_3);
		time_source_start(time_source_update_destroy_0_3);
		
		break;
}

started = true;