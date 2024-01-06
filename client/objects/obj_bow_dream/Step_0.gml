if (time_source_get_state(time_source_target) == time_source_state_active) {

if (instance_exists(target))
		image_angle = point_direction(x, y, target.x, target.y) - 90;
		
if (!instance_exists(arrows_instance)) exit;
	arrows_instance.image_angle = image_angle + 90;

};

if (time_source_get_state(time_source_shot) == time_source_state_active) {
	image_index =  lerp(0, index, step * dtime);	
	index = 5;
};
step = 0.1 * dtime 
if (time_source_get_state(time_source_bow_destroy) == time_source_state_active) {
	
	image_alpha -= step * dtime;
};

time_source_start(time_source_target);