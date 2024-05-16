
if (!image_alpha) {
	image_alpha += 0.5;	
}

if (stage == 0) {
	radius -= 2 * dtime;
	if (radius <= 0) {
		stage = 1;
	};
}
else {
	radius += 2 * dtime;
	if (radius >= radius_max) {
		stage = 0;
	};
}

alpha += 0.01;

x = center_x + radius * cos(alpha);
y = center_y + radius * sin(alpha);

image_angle = point_direction(0, 0, dcos(alpha), -dsin(alpha));