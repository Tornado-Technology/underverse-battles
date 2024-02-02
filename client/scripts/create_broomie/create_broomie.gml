function create_broomie(x, y, object, direction, side, angle_speed, max_acceleration, storage_index = 0, send_data = fight_network_mode) {
	if (send_data) send_battle_object_broomie(x, y, object, direction, side, angle_speed, max_acceleration, storage_index);
	
	return instance_create_depth(x, y, fight_depth.bullet_outside_hight, object, {
		image_angle: direction,
		side: side,
		angle_speed_const: angle_speed,
		max_acc: max_acceleration
	});
}