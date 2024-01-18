function create_bone(x, y, object, speed, size, direction, angle, send_object_creation = false) {
	if (send_object_creation) send_battle_object_bone(x, y, object, speed, size, direction, angle);
	
	var instance = instance_create_depth(x, y, fight_depth.bullet_outside_hight, object);
	instance = move_bone(instance, speed, size, direction, angle);
	
	return instance;
}