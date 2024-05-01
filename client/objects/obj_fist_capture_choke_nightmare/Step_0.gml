image_index = index_sprite;
direction = image_angle;
motion_set(direction, speed_count * dtime);

if (time_source_get_state(time_source_capture) == time_source_state_active) {
	fight_soul_damage(damage, destructible, id);	
};

if (time_source_get_state(time_source_capture) == time_source_state_stopped) {
	soul.x += dcos(image_angle) * sprite_width;
	soul.moveable = true;
	instance_destroy();		
};