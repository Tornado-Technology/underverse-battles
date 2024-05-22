if (!hit) {
	var offset = 30;
	y += -dsin(y * dtime);
	depth =  -dsin(x * dtime);
	image_xscale = x > target_place.x ? -1 : 1;
	x = approach(x, target_place.x, speed_count * dtime);
	if (x == target_place.x) {
		hit = true;
		depth =  -dsin(x * dtime);
		//y =  lerp(y, target_place.y + 20, 1 * dtime); 
		index_sprite = index_sprite_finish;
		time_source_start(time_source_spwan_tentacles);
	};		
};

image_index = approach(image_index, index_sprite, 1 * dtime);

if (time_source_get_state(time_source_spwan_tentacles) == time_source_state_stopped) {
	destroy = true;	
}

if (destroy) {
	index_sprite = 0;
	image_alpha -= 0.05 * dtime;
	if ((image_alpha &&  image_index) == 0) {
		instance_destroy();	
	};
};

