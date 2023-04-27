/// @desc Bad time

if (!started) {
	var  border_decrease = 20;
	_border = battle_border_create(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
	if (battle_border_start_animation_end()) exit;
	
	_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
	_soul.changeable_direction = true;
	
	num = 12;
	
	bone_size_update_0_0 = 5.4;
	bone_scale = 3;
	if (attack_num == 1) bone_scale = 4.4;
	
	update_2_0();
	time_source_start(time_source_update_3_0);
	time_source_start(time_source_update_3_1);
	time_source_start(time_source_update_destroy_3_2);
	
	started = true;
}

var warning_scale = 10;
if(new_warning) {
	draw_warning(side, warning_scale);
	audio_play_sound_plugging(snd_warning);
	new_warning = false;
}