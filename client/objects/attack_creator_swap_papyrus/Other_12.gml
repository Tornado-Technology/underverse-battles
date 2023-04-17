/// @desc Orange attack
if (!started) {
	switch (attack_num) {
		case 0:
			var border_decrease = 25 + _power*3
			_border = battle_border_create(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
			if (battle_border_start_animation_end()) exit;
	
			_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
			_soul.changeable_direction = true;
		
			bone_scale = 2.2;
	
			num = 12;
			prev_side = 2;

			update_2_0();
			time_source_start(time_source_update_2_0);
			time_source_start(time_source_update_2_0_2);
			time_source_start(time_source_update_destroy_2_0);
			started = true;
			break;
	
		case 1:
			_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
			if (battle_border_start_animation_end()) exit;
	
			_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
	
			num = 12;
			bone_scale = 4.4;
		
			update_2_1(_power);
			time_source_start(time_source_update_2_1);
			time_source_start(time_source_update_2_1_2);
			time_source_start(time_source_update_destroy_2_1);
			started = true;
			break;
	}
}

var warning_scale = _power > 2 ? 10 : 12;
if(new_warning) {
	draw_warning(side, warning_scale);
	audio_play_sound_plugging(snd_warning);
	new_warning = false;
}