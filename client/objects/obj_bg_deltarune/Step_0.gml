if (emergence) {
	if (alpha < 1) {
		alpha += 0.05;
		layer_background_alpha(layer_bg_1, alpha);
		layer_background_alpha(layer_bg_2, alpha);
		layer_background_alpha(layer_bg_3, alpha);
	}
	else
		emergence = false;
}

if (disappearance) {
	if (alpha > 0) {
		alpha -= 0.05;
		layer_background_alpha(layer_bg_1, alpha);
		layer_background_alpha(layer_bg_2, alpha);
		layer_background_alpha(layer_bg_3, alpha);
	}
	else {
		disappearance = false;
		instance_destroy();
	}
}