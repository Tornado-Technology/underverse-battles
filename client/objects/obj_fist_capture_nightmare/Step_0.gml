image_index = lerp(image_index, index_sprite, step * dtime);

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
	obj_battle_soul.x = approach(obj_battle_soul.x, x, speed_count * dtime);
	obj_battle_soul.y = approach(obj_battle_soul.y, y, 2 + speed_count * dtime);
	obj_battle_soul.image_alpha = 0;
};

if (time_source_get_state(time_source_capture) == time_source_state_stopped) {
	destroy = true;
};

if (destroy) {
	if (place_meeting(x , y - sprite_get_height(sprite_index), obj_slime_nightmare)) {	
		obj_battle_soul.image_alpha = 1;
		instance_destroy();	
	};
};
