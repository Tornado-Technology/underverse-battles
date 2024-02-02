event_inherited();

if (is_smooth) {
	image_angle += smooth_angle_speed * dtime;
	smooth_angle_speed = lerp(smooth_angle_speed, angle_speed, 0.1);
	exit;
}

image_angle += angle_speed * dtime;