event_inherited();

time++;

if (direction < 270)
	direction++;
if (direction > 270)
	direction--;

image_angle = direction + 90;

if (speed < 1.5)
	speed++;
if (speed > 1.5)
	speed--;

time_create_ink = approach(time_create_ink, time_create_ink_max, time_create_ink_step);

if (y > room_height) instance_destroy();