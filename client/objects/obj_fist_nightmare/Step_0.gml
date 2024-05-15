direction = image_angle;
image_index = approach(image_index, index_sprite, 1 * dtime);
motion_set(direction, speed_count * dtime);

if (destroy) {
	index_sprite = 0;
	image_alpha -= 0.05 * dtime;
	if ((image_alpha &&  image_index) == 0) {
		instance_destroy();	
	}
	
};

if (place_meeting(x, y, obj_spinning_platform)) {
	destroy = true;	
}