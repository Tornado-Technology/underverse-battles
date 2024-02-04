if (is_collided) {
	cooldown = cooldown_max;
	is_collided = false;
	
	audio_play_sound_plugging(snd_graze);
}

if (cooldown > 0) cooldown--;