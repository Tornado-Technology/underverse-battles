image_index = sprite_frame;
image_alpha = alpha;

angle += speed_count * dtime;

var xs = dcos(angle) - dcos(angle) * 120;

y = ystart + dsin(angle) - dsin(angle * 2) * radius;
x = xstart + xs;

if (!destroy) {
	alpha = lerp(alpha, !backwards ? 1 : 0.5,  step * dtime);
} else {
	alpha -= 0.05 * dtime;
	if (alpha <= 0) {	
		instance_destroy();	
	}
}

if (xs < 0) {
	depth = approach(depth, fight_depth.bullet_outside_hight, 0.07 * dtime);
	backwards = false;	
	image_xscale = lerp(image_xscale, -1, step * dtime);
}
if (xs > 40) {
	depth = approach(depth, fight_depth.border, 0.07 * dtime);
	backwards = true;	
	image_xscale = lerp(image_xscale, 1, step * dtime);
}