/* Sound */
if (movement_speed_x != 0 and moveable) {
	if (!audio_is_playing(snd_walking_sans))
		audio_play_sound(snd_walking_sans, 1, true);
}
else
	audio_stop_sound(snd_walking_sans);