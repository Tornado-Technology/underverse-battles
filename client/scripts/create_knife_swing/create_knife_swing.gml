function create_knife_swing(x, y, object, angle, distance) {
	return instance_create_depth(x, y, fight_depth.bullet_outside_hight, object, {
		image_angle: angle,
		scale: distance
	});
}