if (!stop_alpha) {
	if (image_alpha < 1) {
		image_alpha += 0.1;
	}
}

if (time_source_get_state(time_source_target) == time_source_state_active) {
	if (instance_exists(target))
		image_angle = point_direction(x, y, target.x, target.y);
		
	if (!instance_exists(arrows_instance)) exit;
		arrows_instance.image_angle = image_angle;
}

if (time_source_get_state(time_source_bow_destroy) == time_source_state_active) {
	stop_alpha = true;	
	index = 4;
	image_alpha -= step * dtime;
};

image_index =  lerp(image_index, index, step * dtime);	
