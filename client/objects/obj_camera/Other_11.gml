///@desc Target
if (mode == camera_mode.target) {
	target_position = new Point(
		target.x - view_width / 2,
		target.y - view_height / 2
	);
}
if (mode == camera_mode.target_object && target_object != noone && instance_exists(target_object)) {
	target_position = new Point(
		target_object.x - view_width / 2,
		target_object.y - view_height / 2
	);
}