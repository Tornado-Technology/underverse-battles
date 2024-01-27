function create_drop(x, y, object, speed, direction, use_gravity_force, send_data = false) {
	if (send_data) send_battle_object_drop(x, y, object, speed, direction, use_gravity_force);
	
	return instance_create_depth(x, y, fight_depth.bullet_outside_hight, object, {
		speed_const: speed,
		direction: direction,
		image_angle: direction + 90,
		use_gravity_force: use_gravity_force
	});
}