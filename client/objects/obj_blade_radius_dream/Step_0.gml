if (gradually_alpha) {
	if (image_alpha <= 1) {
		image_alpha += 0.1;	
	};	
};

if(gradually_speed) {
	if(speed_angle <= speed_const) {
		speed_angle = approach(speed_angle, speed_const, 0.01 * dtime);
	} else {
		gradually_speed = false;	
	};
};

if (stage == 0) {
	radius -= speed_angle * dtime;
	if (radius <= sprite_height) {
		stage = 1;	
	};
} else {
	radius += speed_angle * dtime;
	
	if(radius >= radius_max) {
		stage = 0;	
	};
};

x = center_x + dcos(angle) * radius;
y = center_y + -dsin(angle) * radius;

angle += speed_angle * dtime;

image_angle = angle;