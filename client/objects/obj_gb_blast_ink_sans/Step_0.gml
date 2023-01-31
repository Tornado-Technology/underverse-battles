image_angle = _angle;
image_xscale = max_xscale;

if (stage == 0 and image_yscale < max_scale)
	image_yscale += 0.2;
else if (stage == 0)
	stage = 1;

if (stage == 1 and image_alpha > 0) {
	image_yscale -= 0.1;
	image_alpha -= 0.05;
}
else if (stage == 1)
	instance_destroy();