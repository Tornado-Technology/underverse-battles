image_index = index_sprite;

y = approach(y, move_beginning ? target_beginning.y : target_end.y, speed_count * dtime);

if (move_beginning) {
	if (y == target_beginning.y) {	
		instance_destroy();	
	};
	
	if (capture) {
		move_beginning = false;
	};
}
else  {
	if (y == target_end.y) {
		instance_destroy();
	};
}

if (time_source_get_state(time_source_capture) == time_source_state_active) {
	soul.x = approach(soul.x, x, speed_count * dtime);
	soul.y = approach(soul.y, y, speed_count * dtime);
};

if (time_source_get_state(time_source_capture) == time_source_state_stopped) {
	soul.moveable = true;
	instance_destroy();		
};
