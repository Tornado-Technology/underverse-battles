time++;

if (image_alpha < 1)
	image_alpha += 0.05;

if (time < 16) exit;

if (image_angle == 360)
	image_angle = 0;
image_angle += 4;

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
	
x = center_x + radius*cos(alpha);
y = center_y + radius*sin(alpha);