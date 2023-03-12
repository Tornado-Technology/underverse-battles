time++;

if (time <= 20) {
	image_xscale += 0.05;
	image_yscale += 0.05;
}
else if (time > 21) {
	image_xscale -= 0.05;
	image_yscale -= 0.05;
	if (image_xscale <= 0 || image_yscale <= 0)
		instance_destroy();
}

if (time == 21) {
	instance_destroy(warning);
}