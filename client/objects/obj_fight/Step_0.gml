/// @desc Timer
if (state == fight_state.choosing) {
	timer_start();
} else if (fight_get_enemy_action(0) > -1) {
	timer_stop();
}

if (timer_expired()) {
	fight_set_enemy_action(0, 3);
}

if (battle_death_animation) {
	var shift_range = 3;
	var shift_speed = 0.1;
	fight_move_enemy_position_x(enemy_death_id, wave(shift_range, -shift_range, shift_speed, 0) / x_shift);

	x_shift += 0.1;
	time++;

	if (battle_continues) {
		instance_destroy(obj_battle);
		audio_stop_all();
		audio_play_sound_plugging(snd_damage);
		battle_continues = false;
	}

	if (time >= 70) { 
		global.fight_instance = noone;
		room_goto(ending_room);
	}
}
