function scale_bone(instance, scale, scale_step, send_data = fight_network_mode) {
	if (send_data) send_battle_object_bone_scale(instance, scale, scale_step);
	
	instance.change_scale(scale, scale_step);
	return instance;
}