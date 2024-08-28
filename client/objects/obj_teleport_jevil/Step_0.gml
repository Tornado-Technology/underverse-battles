image_index = sprite_frame;
image_alpha = alpha;

image_xscale = approach(image_xscale, start_xscalse, step * dtime);


if (sprite_frame <= 1) {
	sprite_frame += step;	
}

if(sprite_frame == 1 && !be_spwan) {
	spwan();
	be_spwan = true;	
	motion_set(direction, speed_count * dtime);
	draw_shadow = true;
	time_source_start(time_source_moving);
}

if (draw_shadow) { 
	part_system_position(particle, x + offset, y);
	part_system_color(particle, c_white, alpha_shadow);
}

if (destroy) {
	alpha -= 0.08 * dtime;
	alpha_shadow -= 0.05 * dtime;
	if (alpha <= 0) {
		instance_destroy();	
	}
}
