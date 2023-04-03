event_inherited();

send_attack = function() {
	send_fight_power(selected_power);
	send_fight_action(selected_action);
	timer_stop();
}

set_action_power = function() {
	send_attack();
}

skip = function() {
	send_fight_skip();
	timer_stop();
	audio_play_sound(sound_select, 0, false);
}

special_action = function() {
	send_fight_special_action();
	timer_stop();
	audio_play_sound(sound_select, 0, false);
}