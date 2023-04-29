if (global.fight_instance.story_mode) {
	soundtrack = global.fight_instance.soundtrack;
}
else {
	var _soundtrack_character = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK, snd_rude_buster);
	var _soundtrack_custom = memory_get(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.SOUNDTRACK_CUSTOM);

	soundtrack = _soundtrack_custom;
	if (_soundtrack_custom == undefined)
		soundtrack = _soundtrack_character;
}

//Reset sounds
audio_stop_all();

audio_play_sound_once(snd_start_battle);

if (is_struct(soundtrack)) {
	soundtrack.play(1, true);
	exit;
}
else {
	audio_play_sound(soundtrack, 2, true);
}