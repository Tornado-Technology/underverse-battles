if (image_alpha <= 1) {
	image_alpha += 0.05 * dtime;	
}

image_angle = angle;

image_xscale = approach(image_xscale, finish_xsacle, step * dtime);
image_yscale = approach(image_yscale, finish_ysacle, step * dtime);
	
if(image_xscale == finish_xsacle && image_yscale == finish_ysacle)  {
	motion_set(direction, speed_count * dtime);
}