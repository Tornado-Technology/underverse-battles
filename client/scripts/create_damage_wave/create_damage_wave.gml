function create_damage_wave(x, y, object, angle, speed, send_object_creation = false) {
	if (send_object_creation) send_battle_object_damage_wave(x, y, object, angle, speed);
	
	instance = instance_create_depth(x, y, 0, object);
	instance._target_angle = angle;
	instance.speed_const = speed;
	
	
	
	return instance;
}