if (image_yscale != max_scale) {
	if (image_angle < 1) {
		image_angle += 0.5;	
	};
}
else {
	image_alpha -= 0.3;	
	if (image_alpha <= 0) {
		instance_destroy();
	};
};
image_xscale = lerp(image_xscale, 15, step * dtime);
image_yscale = lerp(image_yscale, max_scale * 2, step * dtime);

