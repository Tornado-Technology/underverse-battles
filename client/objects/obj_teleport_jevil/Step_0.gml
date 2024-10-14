image_index = sprite_frame;
image_alpha = alpha;

image_xscale = approach(image_xscale, start_xscalse, step * dtime);
sprite_frame = approach(sprite_frame, 1, step * dtime);	

if(sprite_frame == 1 && !be_spwan) {
	spwan();
	be_spwan = true;	
	motion_set(direction, speed_count * dtime);
}

if (destroy) {
	alpha -= 0.08 * dtime;
	if (alpha <= 0) {
		instance_destroy();	
	}
}
