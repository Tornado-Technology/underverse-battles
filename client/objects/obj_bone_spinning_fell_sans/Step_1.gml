image_angle = (image_angle + 5) % 360;

if(can_move){
	motion_set(_angle,_speed);
}