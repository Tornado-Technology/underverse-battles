function create_spinning_bone(x, y, object, speed, size, direction, angle, angle_speed, send_object_creation = false) {
	if (send_object_creation) send_battle_object_spinning_bone(x, y, object, speed, size, direction, angle, angle_speed);
	
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, object);
	instance = move_bone(instance, speed, size, direction, angle);
	instance.angle_speed = angle_speed;
	return instance;
}