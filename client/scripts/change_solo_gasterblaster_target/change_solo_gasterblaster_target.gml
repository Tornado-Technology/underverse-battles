function change_solo_gasterblaster_target(instance, index, target, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_change_solo_gasterblaster_target(index, target, storage_index);
	
	instance.target = target;
	
	return instance;
}