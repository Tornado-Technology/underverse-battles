/// @desc Bones
if (started) exit;

switch (attack_num) {
	case 0:	// Кости на всю высоту
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		create_soul(_border.x, _border.y, battle_soul_type.orange);
		
		bone_size_update_0_0 = 8.3;
		update_0_0(_power);
		time_source_start(time_source_update_0_0);
		time_source_start(time_source_update_stop_0_0);
		time_source_start(time_source_update_destroy_0_0);
		break;
		
	case 1: // Кости и оранжевые кости
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
		
		update_0_1(_power);
		time_source_start(time_source_update_0_1);
		time_source_start(time_source_update_stop_0_1);
		time_source_start(time_source_update_destroy_0_1);
		break;
	
	case 2:	// Вылезающие кости из стенок
		var border_decrease = 20;
		_border = battle_border_create(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
		
		var bone_scale = 2;
		var bone_scale_step = 0.1;
		var num = 10;
		var i = 0;
		repeat (num) {
			_bones[i] = create_bone(_border.x - _border.left + i * 10, _border.y - _border.up - 20, bone_obj, 0, 1, 270, 180);
			_bones[i].change_scale(bone_scale, bone_scale_step);
			i++;
		}
		repeat (num) {
			_bones[i] = create_bone(_border.x + _border.right - (i - num) * 10, _border.y + _border.down + 20, bone_obj, 0, 1, 90, 0);
			_bones[i].change_scale(bone_scale, bone_scale_step);
			i++;
		}
		repeat (num) {
			_bones[i] = create_bone(_border.x - _border.left - 20, _border.y + _border.down - (i - 2*num) * 10, bone_obj, 0, 1, 0, 270);
			_bones[i].change_scale(bone_scale, bone_scale_step);
			i++;
		}
		repeat (num) {
			_bones[i] = create_bone(_border.x + _border.right + 20, _border.y - _border.up + (i - 3*num) * 10, bone_obj, 0, 1, 180, 90);
			_bones[i].change_scale(bone_scale, bone_scale_step);
			i++;
		}
		audio_play_sound_plugging(snd_emergence);
		
		update_0_2(_power);
		time_source_start(time_source_update_0_2);
		time_source_start(time_source_update_destroy_0_2);
		break;
		
	case 3: // Две кости
		_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
		if (battle_border_start_animation_end()) exit;
		
		_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
		
		update_0_3(_power);
		time_source_start(time_source_update_0_3);
		time_source_start(time_source_update_destroy_0_3);
		break;
}

started = true;