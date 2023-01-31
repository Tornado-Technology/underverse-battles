snd = fight_get_soundtrack();

//Reset sounds
audio_stop_all();

//Start obj_fight sound
audio_play_sound_once(snd_start_battle);

if (snd == undefined) {
	audio_play_sound(snd_rude_buster, 1, true);
	exit;
}

if (is_struct(snd)) {
	snd.set_gain(0.5, 0);
	snd.play(1, true);
	exit;
}

audio_play_sound(snd, 1, true);
