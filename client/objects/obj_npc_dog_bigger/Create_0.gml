event_inherited();

is_barking = false;

woff = function() {
	is_barking = true;
	image_index = 1;
	
	alarm_set(0, 30 / dtime);
	audio_play_sound_plugging(snd_dog_barking);
}