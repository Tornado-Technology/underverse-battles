index = approach(index, 6, scale_time * dtime);
image_index = index;
if (scale_time > 0 && index == 6) {
	image_yscale = approach(image_yscale,  scale_const, scale_time * dtime);
}

if (!can_move) exit;

//speed = speed_const * dtime;


if (image_yscale >= scale_const) {
	scale_const = scale_start;		
};

if (image_yscale <= scale_start) {
	scale_const = const;
	if	(index == 6) {
		destroy = true;
	};
};

if (destroy) {
	image_alpha -= 0.1;	
}

if (image_alpha <= 0) {
	instance_destroy();	
}
