function change_solo_gasterblaster_target(instance, target, send_data = fight_network_mode) {
	if (send_data) send_battle_object_change_solo_gasterblaster_target(instance, target);
	
	instance.target = target;
	
	return instance;
}