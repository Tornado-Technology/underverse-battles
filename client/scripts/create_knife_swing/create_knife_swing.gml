function create_knife_swing(x, y, object, angle, distance, send_data = false) {
	if (send_data) send_battle_object_knife_swing(x, y, object, angle, distance);
	
	return instance_create_depth(x, y, fight_depth.bullet_outside_hight, object, {
		image_angle: angle,
		scale: distance
	});
}