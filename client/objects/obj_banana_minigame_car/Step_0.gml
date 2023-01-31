if (!is_crush) exit;
image_speed = 0;
image_index = 1;

rotate_time = approach(rotate_time, rotate_time_max, 1);

if (rotate_time >= rotate_time_max) {
	rotate_time = 0;
	image_angle += 90;
}

x += crush_speed_x;
y += crush_speed_y;

if (!sound_was_play) {
	audio_play_sound_plugging(snd_bigcar_yelp);
	audio_play_sound_plugging(snd_hitcar);
	sound_was_play = true;
}

if (y < -48)
	instance_destroy();