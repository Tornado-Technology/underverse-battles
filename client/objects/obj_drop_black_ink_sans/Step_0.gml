if (use_gravity_force) {
	if (direction < 270)
		direction += dtime;
	if (direction > 270)
		direction -= dtime;
}

if (speed < speed_const * dtime)
	speed += 0.1 * dtime;
else
	speed = speed_const * dtime;
image_angle = direction + 90;
_angle = direction;


if (y > room_height) instance_destroy();

time_create_ink = approach(time_create_ink, time_create_ink_max, time_create_ink_step);