function create_spinning_bone(x, y, object, speed, size, direction, angle, angle_speed) {
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, object);
	instance.speed_const = speed;
	instance.image_yscale = size;
	instance.direction = direction;
	instance.image_angle = angle;
	instance.angle_speed = angle_speed;
	
	return instance;
}