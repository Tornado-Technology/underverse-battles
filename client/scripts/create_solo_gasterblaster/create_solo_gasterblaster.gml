function create_solo_gasterblaster(x, y, object, target_time, charge_time, destroy_time, send_data = false) {
	if (send_data) send_battle_object_solo_gasterblaster(x, y, object, target_time, charge_time, destroy_time);
	
	return instance_create_depth(x, y, fight_depth.bullet_outside_hight, object, {
		target_time: target_time,
		charge_time: charge_time,
		destroy_time: destroy_time
	});
}