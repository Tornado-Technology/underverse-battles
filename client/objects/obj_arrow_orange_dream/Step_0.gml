if (!move) exit;

motion_set(image_angle, speed_const * dtime);

if(place_meeting(x, y, obj_solid)) {
	if(!touching_walls) {
		touching_walls = true;
		return;	
	};
};

if (ricochet && touching_walls && !is_destroying){
	collision();
};

if (is_destroying) {
	touching_walls = false;
	image_alpha -= 0.1;
	if (image_alpha <= 0) {
		instance_destroy();
	};	
}