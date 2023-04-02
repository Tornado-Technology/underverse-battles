/// @desc Blue attack

if (!started) {
	_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
	if (battle_border_start_animation_end()) exit;
	
	if (attack_num == 0)
		_soul = create_soul(_border.x, _border.y, battle_soul_type.blue);
	else
		_soul = create_soul(_border.x, _border.y, battle_soul_type.red);
	
	num = 12;

	bone_scale = _power > 2 ? 2.8 : 3;
	if (attack_num == 1) bone_scale = 4.4;
	
	update_2_0(_power);
	time_source_start(time_source_update_2_0);
	time_source_start(time_source_update_2_1);
	time_source_start(time_source_update_destroy_2_2);
	
	started = true;
}

if (attack_num == 0) {
	var warning_scale = 5;
	if (variable_instance_exists(_soul, "blue_attack")) {
		if (!_soul.blue_attack and new_warning) {
			draw_warning(side, warning_scale);
			audio_play_sound_plugging(snd_warning);
			new_warning = false;
		}
	}
}
else {
	var warning_scale = _power > 2 ? 10 : 12;
	if(new_warning) {
		draw_warning(side, warning_scale);
		audio_play_sound_plugging(snd_warning);
		new_warning = false;
	}
}