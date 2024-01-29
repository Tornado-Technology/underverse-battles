function scale_bone_array(instances, scale, scale_step, send_data = fight_network_mode) {
	if (send_data) send_battle_object_bone_array_scale(instances, scale, scale_step);
	
	var i = 0;
	repeat(array_length(instances)) {
		instances[i].change_scale(scale, scale_step);
		i++;
	}
}