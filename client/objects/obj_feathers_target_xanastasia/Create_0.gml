event_inherited();

damage = get_char_damage(obj_character_xanastasia);
image_alpha = 0;


stage = 0;

step = 1;
radius_max = point_distance(x, y, center_x, center_y);
radius = radius_max;
angle = image_angle;
alpha = point_direction(x, y, center_x, center_y);

moving = function () {

	if (angle >= 360) {
		angle = 0;	
	};

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
	};


	x = center_x + dcos(angle) * radius;
	y = center_y + -dsin(angle) * radius;

	angle += step;

	image_angle = point_direction(x, y, center_x, center_y);		
}