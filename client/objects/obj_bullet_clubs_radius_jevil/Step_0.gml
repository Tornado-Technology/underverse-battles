image_index = sprite_frame;
image_angle = angle;

if (!destroy) {
	if (image_alpha <= 1) {
		image_alpha += 0.3 * dtime;	
	};
}
else {	
	if (image_alpha >= 0) {
		image_alpha -= 0.3 * dtime;	
	};
};

