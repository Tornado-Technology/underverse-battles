if (time_source_get_state(time_source_move) == time_source_state_active) {
if (image_alpha < 1)
	image_alpha += 0.05;
	
	if (stage == 0) {
		radius -= 2;
	if (radius <= 0) {
			stage = 1;
			audio_play_sound_plugging(snd_spare_up);
	}
}
else {
	radius += 2;
	if (radius >= radius_max)
		stage = 0;
}

alpha += 0.05;
	
x = center_x + radius * cos(alpha);
y = center_y + radius * sin(alpha);
};
time_source_start(time_source_move);