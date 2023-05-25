/// @param {Asset.GMSound} index
function audio_play_sound_plugging(index) {
	if (!audio_is_playing(index)) {
		audio_play_sound(index, 0, false);
		return;
	}
	
	audio_stop_sound(index);
	audio_play_sound(index, 0, false);	
}
