image_yscale = approach(image_yscale,  scale_const, scale_time * dtime);

if (!can_move) exit;

speed = speed_const * dtime;

if (image_yscale >= scale_const) {
	scale_const = scale_start;	
}

if (image_yscale <= scale_start) {
	scale_const = const;
}