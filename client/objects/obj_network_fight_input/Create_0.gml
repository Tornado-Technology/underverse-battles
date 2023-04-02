event_inherited();

send_attack = function() {
	send_fight_power(selected_power);
	send_fight_action(selected_action);
}

set_action_power = function() {
	send_attack();
}

special_action = function() {
	send_fight_special_action();
	audio_play_sound(sound_select, 0, false);
}