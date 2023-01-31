if (emergence) {

	if (image_alpha < 1)
		image_alpha += 0.05;
	if (image_xscale > 1)
		image_xscale -= 0.05;
	if (image_yscale > 1)
		image_yscale -= 0.05;
	if (image_alpha == 1 and image_xscale == 1 and image_yscale == 1)
		emergence = false;
}

if (disappearance) {
	y += 2;
	
	if (image_alpha > 0)
		image_alpha -= 0.05;
	else
		instance_destroy();
}