function destroy_battle_object_array(array, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_destroy_battle_object(storage_index);
	instance_destroy_array(array);
}