image_angle += (dcos(time) * 2) + scale_const * dtime; 
time += scale_speed * dtime;
if (time >= 360) { 
	time = 0;
};