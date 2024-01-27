function change_solo_gasterblaster_position(instance, new_x, new_y, send_data = false) {
	if (send_data) send_battle_object_change_solo_gasterblaster_position(instance, x_dir, y_dir);
	
	instance.x_dir = new_x;
	instance.y_dir = new_y;
	
	return instance;
}