function destroy_battle_object_array(array, send_data = fight_network_mode) {
	if (send_data) {
		var i = 0;
		repeat (array_length(array)) {
			send_destroy_battle_object(array[i]);
			i++;
		}
	}
	instance_destroy_array(array);
}