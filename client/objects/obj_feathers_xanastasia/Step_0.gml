image_angle = _target_angle;

time += dtime
image_angle += sin(time/5)*10

if (image_alpha < 1)
	image_alpha += alpha_step * dtime;
	
motion_set(image_angle, _speed/(1+(time/100)) * dtime);