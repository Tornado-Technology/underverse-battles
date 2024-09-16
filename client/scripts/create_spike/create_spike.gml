function create_spike(x, y, object, speed, direction, struct = {}) {
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, object, struct);
	instance.speed_const = speed;
	instance.direction = direction;
	instance.image_angle = direction;
	return instance;
}