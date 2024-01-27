function set_big_knife_spin(instance, rotation_speed, send_data = false) {
	if (send_data) send_battle_object_big_knife_spin(instance, rotation_speed);
	
	instance.spin(rotation_speed);
}