function set_big_knife_move_up(instance, send_object_creation = false) {
	if (send_object_creation) send_battle_object_big_knife_move_up(instance);
	
	instance.move_up();
}