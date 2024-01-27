function destroy_battle_object_array(array, send_data = false) {
	if (send_data) send_destroy_battle_object_array(array);
	instance_destroy_array(array);
}