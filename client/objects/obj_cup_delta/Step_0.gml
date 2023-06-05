/// @desc Move to target
if (target_direction == dir.left) {
	target_speed = -target_left / x;
	
	if (x <= target_left) {
		target_direction = dir.right;
	}
}

if (target_direction == dir.right) {
	target_speed = x / target_right;
	
	if (x >= target_right) {
		target_direction = dir.left;
	}
}

x += target_speed * 2 * dtime;
image_angle = wave(target_angle / 2, target_angle, dtime, 10);
