function create_spike(x, y, object, speed, direction, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_spike(x, y, object, speed, direction, storage_index);
	
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, object);
	instance.speed_const = speed;
	instance.direction = direction;
	instance.image_angle = direction;
	return instance;
}