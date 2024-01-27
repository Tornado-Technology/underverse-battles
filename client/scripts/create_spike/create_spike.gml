function create_spike(x, y, object, speed, direction, send_data = false) {
	if (send_data) send_battle_object_spike(x, y, object, speed, direction);
	
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, object);
	instance.speed_const = speed;
	instance.direction = direction;
	instance.image_angle = direction;
	return instance;
}