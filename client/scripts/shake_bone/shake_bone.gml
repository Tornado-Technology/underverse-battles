function shake_bone(instance, send_data = false) {
	if (send_data) send_battle_object_bone_shake(instance);
	
	instance.shake();
}