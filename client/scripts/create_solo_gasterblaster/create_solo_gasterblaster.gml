function create_solo_gasterblaster(x, y, object, target_time, charge_time, destroy_time, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_solo_gasterblaster(x, y, object, target_time, charge_time, destroy_time, storage_index);
	
	return instance_create_depth(x, y, fight_depth.bullet_outside_hight, object, {
		target_time: target_time,
		charge_time: charge_time,
		destroy_time: destroy_time
	});
}