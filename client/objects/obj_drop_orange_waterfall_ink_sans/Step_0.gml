
if(is_growing) {
	image_yscale += (speed_const * 0.2) * dtime;
	
	if(point_distance(x, y + sprite_height, x, border_down) <= 5) {
		is_growing = false;	
		time_source_start(time_source_destroying);
	};
};

if(destroying) {
	image_xscale = approach(image_xscale, 0, step * dtime);
	
	if(image_xscale == 0) {
		instance_destroy();	
	};
};


time_create_ink = approach(time_create_ink, time_create_ink_max, time_create_ink_step);