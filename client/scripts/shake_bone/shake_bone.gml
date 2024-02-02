function shake_bone(instance, index, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_bone_shake(index, storage_index);
	
	instance.shake();
}