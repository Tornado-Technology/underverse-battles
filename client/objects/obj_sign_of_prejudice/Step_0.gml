if (time_source_start(time_source_prejudice) != time_source_state_stopped) {
	var merged = random(1);
	image_blend = merge_colour(colour_one, colour_two, merged);
};

if (destroy) {
	if (image_alpha <= 0) {
		image_alpha += 0.5;	
	}
	else {
		instance_destroy();	
	};
};