function create_damage_wave(x, y, object, angle, speed) {
	instance = instance_create_depth(x, y, 0, object);
	instance._target_angle = angle;
	instance.speed_const = speed;
	
	return instance;
}