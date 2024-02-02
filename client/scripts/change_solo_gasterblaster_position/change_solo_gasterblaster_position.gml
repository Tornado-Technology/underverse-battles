function change_solo_gasterblaster_position(instance, index, new_x, new_y, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_change_solo_gasterblaster_position(index, new_x, new_y, storage_index);
	
	instance.x_dir = new_x;
	instance.y_dir = new_y;
}