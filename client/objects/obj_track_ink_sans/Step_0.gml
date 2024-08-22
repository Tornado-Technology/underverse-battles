if (instance_exists(target_obj)) {
	image_xscale += speed_const * dtime;
	
	if (target_obj.is_destroying) {
		is_destroying = true;
	}
};

if (is_destroying) {
	image_yscale -= 0.5 * dtime;	
}
if (image_yscale <= 0) {
	instance_destroy();	
};

time_create_ink = approach(time_create_ink, time_create_ink_max, time_create_ink_step);