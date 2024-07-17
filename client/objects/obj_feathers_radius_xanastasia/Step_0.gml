if (destroy) {
	image_alpha -= 0.1;
	if (image_alpha <= 0) {
		instance_destroy();	
	};
	
} else {
	if (image_alpha <= 1) {
		image_alpha += 0.05;
	};
};



x = center_x + dcos(angle) * radius;
y = center_y + -dsin(angle) * radius;

angle += (step * 2);
	
image_angle = point_direction(x, y, center_x, center_y);

impact_on_radius();







