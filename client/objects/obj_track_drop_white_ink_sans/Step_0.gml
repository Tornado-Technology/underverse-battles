if(instance_exists(target_obj)) {
	image_xscale +=  speed_const * dtime;
} else {
	if(time_source_get_state(time_source_destroy_self) == time_source_state_initial){
		time_source_start(time_source_destroy_self);	
	};
};


if(destroying) {
	image_yscale -= 0.5 * dtime;	
}
if(image_yscale <= 0) {
	instance_destroy();	
};


time_create_ink = approach(time_create_ink, time_create_ink_max, time_create_ink_step);