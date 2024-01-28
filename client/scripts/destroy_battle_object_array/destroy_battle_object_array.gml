function destroy_battle_object_array(array, send_data = fight_network_mode) {
	if (send_data) send_destroy_battle_object_array(array);
	instance_destroy_array(array);
}