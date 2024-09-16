if (!is_destroying && image_alpha < 1) {
	image_alpha += 0.05 * dtime;
}
if (is_destroying) {
	if (image_alpha > 0) {
		image_alpha -= 0.1 * dtime;
	}
	else {
		instance_destroy();
	}
}

y = approach(y, target_position.y, speed_const * dtime);
x = approach(x, target_position.x, speed_const * dtime);

if (!has_spawned && x == target_position.x && y == target_position.y) {
	spwan();
};