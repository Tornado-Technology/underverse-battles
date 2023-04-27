if (increase) {
	image_xscale += scale_speed * dtime;
	
	if (image_xscale > max_scale)
		increase = false;
}

if (removing) {
	speed = scale_speed * dtime;
	image_xscale -= scale_speed * dtime;
	if (image_xscale <= 0)
		instance_destroy();
}

if (attraction) {
	image_xscale -= scale_speed * dtime;
	if (image_xscale <= 0)
		instance_destroy();
}

if (following_character != noone) {
	x += following_character.x - following_character.xprevious;
	y += following_character.y - following_character.yprevious;
}