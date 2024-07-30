image_alpha = alpha;

if (!alpha && !disappearance) {
	alpha += step * dtime;	
}
else if (disappearance) {
	alpha -= step * dtime;	
};

if (!alpha && disappearance) {
	instance_destroy();
};

motion_set(image_angle, speed_const * dtime);


if (time_source_get_state(time_source_life) == time_source_state_stopped) {
	disappearance = true;
}


