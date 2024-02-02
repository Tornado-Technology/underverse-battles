function scale_bone(instance, index, scale, scale_step, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_bone_scale(index, scale, scale_step, storage_index);
	
	instance.change_scale(scale, scale_step);
}