/// @desc Timer
if (state == fight_state.choosing) {
	timer_start();
}
if (fight_get_player_action(0) > -1) {
	timer_stop();
}

if (timer_expired()) {
	fight_set_player_action(0, 3);
	send_fight_action(3);
	timer_stop();
}

if (battle_ends) {
	var shift_range = 3;
	var shift_speed = 0.1;
	fight_move_player_position_x(player_death_id, wave(shift_range, -shift_range, shift_speed, 0) / x_shift);

	x_shift += 0.1;
	time++;

	instance_destroy(obj_battle);
	audio_stop_all();
	audio_play_sound_plugging(snd_damage);

	if (time >= 70) {
		global.fight_instance = noone;
		room_goto(room_fight_1v1_end);
	}
}
