function create_falling_bone(x, y, object, angle, direction, scale, acceleration, send_object_creation = false) {
	if (send_object_creation) send_battle_object_falling_bone(x, y, object, angle, direction, scale, acceleration);
	
	instance = instance_create_depth(x, y, fight_depth.bullet_outside, object);
	instance.image_angle = angle;
	instance.direction = direction;
	instance.set_fall(scale, acceleration);
	
	return instance;
}