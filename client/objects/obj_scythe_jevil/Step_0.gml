if (image_angle == 360)
	image_angle = 0;
image_angle += -dsin(4) * sprite_height;

if (stage == 0) {
	radius -= step_radius * dtime;
	if (radius <= 0) {
		stage = 1;
	};
}
else {
	radius += step_radius * dtime;
	if (radius >= radius_max) {
	
		stage = 0;
	};
};


x = center_x + dcos(angle) * radius;
y = center_y + -dsin(angle) * radius;

angle += step * dtime;

