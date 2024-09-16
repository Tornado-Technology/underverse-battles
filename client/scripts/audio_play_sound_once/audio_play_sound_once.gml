/// @param {Asset.GMSound} index
/// @param {Real} priority
function audio_play_sound_once(index, priority = 1){
	if (audio_is_playing(index)) return;
	audio_play_sound(index, priority, false);
}
