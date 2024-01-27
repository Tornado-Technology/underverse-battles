function create_bone(x, y, object, speed, size, direction, angle, send_data = false) {
	if (send_data) send_battle_object_bone(x, y, object, speed, size, direction, angle);
	
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, object);
	instance.speed_const = speed;
	instance.image_yscale = size;
	instance.direction = direction;
	instance.image_angle = angle;
	
	return instance;
}