if (!stop_alpha) {
	if (image_alpha < 1) {
		image_alpha += 0.1;
	};
};

image_index =  lerp(image_index, index, step * dtime);	
