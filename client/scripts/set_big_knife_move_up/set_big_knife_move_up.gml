function set_big_knife_move_up(instance, send_data = false) {
	if (send_data) send_battle_object_big_knife_move_up(instance);
	
	instance.move_up();
}