/// @desc Bad time
_time++;

if (!started) {
	var  border_decrease = 20;
	_border = battle_border_create(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
	if (battle_border_start_animation_end()) exit;
	
	_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
	_soul.changeable_direction = true;
	
	num = 12;

	bone_scale = _power > 2 ? 2.8 : 3;
	if (attack_num == 1) bone_scale = 4.4;
	
	update_2_0(_power);
	time_source_start(time_source_update_2_0);
	time_source_start(time_source_update_2_1);
	time_source_start(time_source_update_destroy_2_2);
	
	started = true;
}

var warning_scale = _power > 2 ? 10 : 12;
if(new_warning) {
	draw_warning(side, warning_scale);
	audio_play_sound_plugging(snd_warning);
	new_warning = false;
}