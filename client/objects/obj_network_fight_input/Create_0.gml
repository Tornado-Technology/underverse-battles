event_inherited();

send_attack = function() {
	send_fight_power(selected_power);
	send_fight_action(selected_action + fight_action_type.attack_1);
}

set_action_power = function() {
	send_attack();
}

skip = function() {
	send_fight_skip();
	audio_play_sound(sound_select, 0, false);
}

special_action = function() {
	if (fight_check_player_special_action_readiness(0)) {
		send_fight_special_action();
		audio_play_sound(sound_select, 0, false);
		audio_play_sound_once(snd_special_attack);
	}
}