function create_drop(x, y, object, speed, direction, use_gravity_force) {
	return instance_create_depth(x, y, fight_depth.bullet_outside_hight, object, {
		speed_const: speed,
		direction: direction,
		image_angle: direction + 90,
		use_gravity_force: use_gravity_force
	});
}