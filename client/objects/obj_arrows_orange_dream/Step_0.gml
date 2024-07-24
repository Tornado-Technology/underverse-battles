if (!move) exit;

motion_set(image_angle, speed_const * dtime);

if(place_meeting(x, y, obj_battle_border)) {
	if(!touching_walls) {
		touching_walls = true;
		return;	
	};
};

if (ricochet && touching_walls && !destroy){
	collision();
};

if (destroy) {
	touching_walls = false;
	image_alpha -= 0.1;
	if (image_alpha <= 0) {
		instance_destroy();
	};	
}