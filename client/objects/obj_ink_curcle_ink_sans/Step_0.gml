if (is_disappearing) {
	image_alpha -= 0.1 * dtime;
}
if (image_alpha <= 0)
	instance_destroy();

image_blend = c_rainbow;