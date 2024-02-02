function create_falling_bone(x, y, object, angle, direction, scale, acceleration, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_falling_bone(x, y, object, angle, direction, scale, acceleration, storage_index);
	
	instance = instance_create_depth(x, y, fight_depth.bullet_outside, object);
	instance.image_angle = angle;
	instance.direction = direction;
	instance.set_fall(scale, acceleration);
	
	return instance;
}