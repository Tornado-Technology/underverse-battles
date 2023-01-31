function audio_play_sound_plugging(sd){
	if (!audio_is_playing(sd)) {
		audio_play_sound(sd, 0, false);
	}
	else {
		audio_stop_sound(sd);
		audio_play_sound(sd, 0, false);	
	}
}

function audio_play_sound_once(sd, pr = 1){
	if (!audio_is_playing(sd))
		audio_play_sound(sd, pr, false);
}
