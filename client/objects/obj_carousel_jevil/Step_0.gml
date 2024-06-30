image_index = sprite_frame;
image_alpha = alpha;

angle++;


y = ystart + -dsin(angle) * 20;
x = approach(x, !backwards ? target_position_x : backwards_x, speed_count * dtime);

image_xscale = lerp(image_xscale, !backwards ? -1 : 1, step * dtime);

if (!destroy) {
	alpha = lerp(alpha, !backwards ? 1 : 0.5, step * dtime);
} else {
	alpha -= 0.05 * dtime;
	if(alpha <= 0) {
		instance_destroy();	
	};
};


if(x == target_position_x) {
	depth = fight_depth.border;
	backwards = true;	
};

if(x == backwards_x) {
	depth = fight_depth.bullet_outside_hight;
	backwards = false;	
};