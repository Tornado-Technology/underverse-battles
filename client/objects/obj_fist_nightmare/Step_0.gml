image_index = sprite_fram;
sprite_fram = approach(sprite_fram, index_sprite, step * dtime);


if(smooth_move) {
	y = approach(y, position_y, 2);		
};

motion_set(direction, speed_count * dtime);

if (destroy) {
	index_sprite = 0;
	image_alpha -= 0.05 * dtime;
	if ((image_alpha &&  image_index) == 0) {
		instance_destroy();	
	};
	
};

if (place_meeting(x, y, obj_spinning_platform)) {
	destroy = true;	
};