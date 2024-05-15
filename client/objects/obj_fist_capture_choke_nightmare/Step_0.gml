image_index = lerp(image_index, index_sprite, 0.1);
direction = image_angle;
motion_set(direction, speed_count * dtime);

if (time_source_get_state(time_source_capture) == time_source_state_active) {
	fight_soul_damage(damage, destructible, id);	
};

if (time_source_get_state(time_source_capture) == time_source_state_stopped) {
	soul.x += dcos(image_angle) * sprite_width;
	soul.moveable = true;
	destroy = true;
};

if (destroy) {
	image_alpha -=  0.1 * dtime; 	
	if (image_alpha <= 0){
		instance_destroy();	
		soul.moveable = true;
	}
}