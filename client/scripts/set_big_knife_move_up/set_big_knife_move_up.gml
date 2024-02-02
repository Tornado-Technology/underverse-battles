function set_big_knife_move_up(instance, index, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_big_knife_move_up(index, storage_index);
	
	instance.move_up();
}