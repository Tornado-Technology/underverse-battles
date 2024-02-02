function set_big_knife_spin(instance, index, rotation_speed, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_big_knife_spin(index, rotation_speed, storage_index);
	
	instance.spin(rotation_speed);
}