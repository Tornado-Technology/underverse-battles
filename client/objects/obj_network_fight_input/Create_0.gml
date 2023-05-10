event_inherited();

send_attack = function() {
	send_fight_power(selected_power);
	send_fight_action(selected_action + fight_action_type.attack1);
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
	if (fight_check_player_special_action_readiness(0)) {
		send_fight_special_action();
		timer_stop();
		audio_play_sound(sound_select, 0, false);
	}
}