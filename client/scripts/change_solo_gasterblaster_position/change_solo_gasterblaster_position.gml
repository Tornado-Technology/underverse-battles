function change_solo_gasterblaster_position(instance, new_x, new_y, send_data = fight_network_mode) {
	if (send_data) send_battle_object_change_solo_gasterblaster_position(instance, new_x, new_y);
	
	instance.x_dir = new_x;
	instance.y_dir = new_y;
}