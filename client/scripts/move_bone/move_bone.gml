function move_bone(instance, speed, size, direction, angle){
	if (!instance_exists(instance))
		return undefined;
	instance.speed_const = speed;
	instance.image_yscale = size;
	instance.direction = direction;
	instance.image_angle = angle;
	return instance;
}