function change_angle_speed_spinning_bone(instance, index, angle_speed, is_smooth = false, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_change_angle_speed_spinning_bone(index, angle_speed, is_smooth, storage_index);
	instance.angle_speed = angle_speed;
	instance.is_smooth = is_smooth;
}