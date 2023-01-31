with(other) {
	if (moveable) audio_play_sound_plugging(snd_spare_up);
	
	moveable = false;
}

if (!other.is_otherplayer_soul) {
	if (time_create_ink == time_create_ink_max) {
		time_create_ink = 0;
	
		repeat(irandom_range(1, 5)) {
			var ink = instance_create_depth(0, 0, 0, obj_ink_ui_ink_sans);
			ink.image_blend = c_blue;
		}
	}
}