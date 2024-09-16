/// @param {Asset.GMSound} index
/// @param {Real} priority
function audio_play_soundtrack(index, loop = true, gain = 1, priority = 2) {
	if (audio_is_playing(index)) return;
	audio_play_sound(index, priority, loop);
	audio_sound_gain(index, gain, 0);
}
