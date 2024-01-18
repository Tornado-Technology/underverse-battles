function set_big_knife_spin(instance, rotation_speed, send_object_creation = false) {
	if (send_object_creation) send_battle_object_big_knife_spin(instance, rotation_speed);
	
	instance.spin(rotation_speed);
}