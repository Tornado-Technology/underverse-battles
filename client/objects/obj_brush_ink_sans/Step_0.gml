time++;

if (time == 1)
	audio_play_sound_plugging(snd_emergence);

if (time <= 20) {
	if (image_alpha < 1)
		image_alpha += 0.05;
}

if (time == 30)
	audio_play_sound_plugging(snd_projectile);

timing[0] = 30 + max_acc;
timing[1] = 31 + 2 * max_acc;

if (time >= 30 and time <= timing[0]) {
	ink_x = cos(degtorad(image_angle - 180))*60;
	ink_y = -sin(degtorad(image_angle - 180))*60;
	instance_create_depth(x + ink_x + irandom_range(-2, 2), y + ink_y + irandom_range(-3, 3), fight_depth.bullet_outside, obj_ink_curcle_ink_sans);
	++acc;
	image_angle += acc * side;
}
if (time >= timing[0]+1 and time <= timing[1]) {
	ink_x = cos(degtorad(image_angle - 180))*60;
	ink_y = -sin(degtorad(image_angle - 180))*60;
	instance_create_depth(x + ink_x + irandom_range(-2, 2), y + ink_y + irandom_range(-3, 3), fight_depth.bullet_outside, obj_ink_curcle_ink_sans);
	--acc;
	image_angle += acc * side;
}
if (time > timing[1]) {
	if (image_alpha > 0)
		image_alpha -= 0.05;
	else
		instance_destroy();
}