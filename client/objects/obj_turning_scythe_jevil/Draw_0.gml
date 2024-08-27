if(is_bonb) {
	draw_reset();
	draw_set_alpha(alpha);
	draw_circle(x, y, radius, false);
	draw_reset();
} else {
	event_inherited();	
}