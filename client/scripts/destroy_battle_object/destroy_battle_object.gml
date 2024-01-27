function destroy_battle_object(object, send_data = false) {
	if (send_data) send_destroy_battle_object(array);
	instance_destroy(object);
}