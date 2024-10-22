///@desc Target
if (mode != camera_mode.target || target == noone) exit;

target_position = new Point(
	target.x - view_width / 2,
	target.y - view_height / 2
);