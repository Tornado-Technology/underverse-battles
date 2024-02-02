function move_bone(instance, index, speed, direction, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_bone_move(index, speed, direction, storage_index);
	
	instance.speed_const = speed;
	instance.direction = direction;
}