function move_bone(instance, speed, direction, send_data = fight_network_mode) {
	if (send_data) send_battle_object_bone_move(instance, speed, direction);
	
	instance.speed_const = speed;
	instance.direction = direction;
	return instance;
}