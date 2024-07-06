if (image_alpha < 1) {
	image_alpha += alpha_step * dtime;
}
if (is_rotating) {
	accelerating_time += dtime;
	image_angle = (sin(accelerating_time/30)*371);
	_speed = ((sin(accelerating_time/30)*3) + 2);
}
else {
	image_angle = 0;
}

motion_set(image_angle, _speed * dtime);
	

