if (image_index == 0 and play_sound) {
	audio_play_sound_plugging(snd_click);
	play_sound = false;
}
if (image_index == 1 and !play_sound) {
	play_sound = true;
}