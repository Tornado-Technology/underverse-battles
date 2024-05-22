image_yscale = lerp(image_yscale, scale_const, scale_time * dtime);

motion_set(direction, speed_count * dtime);

if (x <= obj_battle_border.x - obj_battle_border.left) {
	direction = 0;
}
else if (x >= obj_battle_border.x + obj_battle_border.right) {
	direction = 180;
};

if (time_source_get_state(time_source_state) == time_source_state_active) {
		image_blend = merge_colour(c_orange, c_red, 0.5);
		shot = true;
}
else if (time_source_get_state(time_source_state) == time_source_state_stopped && shot) {
	image_blend = c_white;
	shot = false;
	scale_const = scale_const_max;
	time_source_start(time_source_return_state);
};

if (time_source_get_state(time_source_return_state) == time_source_state_stopped) {	
	scale_const = scale_original;
	speed_count = speed_count_original;	
};