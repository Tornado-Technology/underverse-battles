function create_damage_wave(x, y, object, angle, speed, send_data = fight_network_mode) {
	if (send_data) send_battle_object_damage_wave(x, y, object, angle, speed);
	
	instance = instance_create_depth(x, y, 0, object);
	instance._target_angle = angle;
	instance.speed_const = speed;
	
	
	
	return instance;
}