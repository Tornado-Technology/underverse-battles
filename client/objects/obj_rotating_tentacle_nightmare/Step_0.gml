image_angle += (dcos(time) * 2) + rotating_speed * dtime; 
time += time_speed * dtime;
if (time >= 360) { 
	time = 0;
};