function shake_bone(instance, send_data = fight_network_mode) {
	if (send_data) send_battle_object_bone_shake(instance);
	
	instance.shake();
}