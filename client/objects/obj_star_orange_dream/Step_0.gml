if (stage == 0) {
	image_angle -= speed_torsional * dtime;
	motion_set(direction, speed_const * dtime);	
};