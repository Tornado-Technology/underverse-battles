function set_big_knife_move_up(instance, send_data = fight_network_mode) {
	if (send_data) send_battle_object_big_knife_move_up(instance);
	
	instance.move_up();
}