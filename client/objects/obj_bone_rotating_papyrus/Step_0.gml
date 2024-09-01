image_angle += (speed_spinning * dtime) % 360;

if(image_alpha <= 1) {
	image_alpha += step * dtime;	
}

if (image_angle >= 360) {
	image_angle = 0;
	rotating--;
}
	
if (rotating == 0) {
	var target = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y);
	direction = target;
	rotating = -1;
	
	audio_play_sound_plugging(snd_projectile);
}

if (rotating == -1) {
	motion_set(direction, speed_const * dtime);
}