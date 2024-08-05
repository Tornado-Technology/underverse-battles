if (gradually_alpha) {
	if (image_alpha <= 1) {
		image_alpha += step * dtime;	
	};
	
	if(image_alpha >= 1) {
		spwan_ink();
		gradually_alpha = false;
	};
	exit;	
};


if(changes_angle) {
	image_angle = approach(image_angle,  point_direction(x, y, position_x, position_y), 2 + speed_const  * dtime);
	if (!changes) {
		if(image_angle == point_direction(x, y, position_x, position_y)) {
			spwan_ink();
			changes = true;				
		};	
	};
};

motion_set(image_angle, speed_const * dtime);

if(point_distance(x, y, position_x, position_y) <= 15) {
	if(!changes) {
		changes_direction();
	} else {
		destroying = true;
	};
};

if(destroying) {
	image_alpha -= 0.05 * dtime;
	if(image_alpha <= 0) {
		instance_destroy();	
	};
};