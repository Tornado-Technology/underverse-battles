event_inherited();

if (changing) {
	image_yscale = approach(image_yscale, finish_yscale, 0.1);

	if (image_yscale == finish_yscale) {
		changing = false;
		if (call_back_star){  
			time_source_start(time_source_repeat_star);	
		}
	}		
}

if (!call_back_star && !changing) {
	image_yscale = approach(image_yscale, finish_yscale, 0.1);	
}

if (repeat_finish && !changing) {
	time_source_start(time_source_back_changing);
}