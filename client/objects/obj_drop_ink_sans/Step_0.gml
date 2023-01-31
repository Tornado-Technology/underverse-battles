time++;

if (direction < 270)
	direction++;
if (direction > 270)
	direction--;

image_angle = direction + 90;

if (speed < 2)
	speed++;
if (speed > 2)
	speed--;;

if (y > room_height) instance_destroy();

time_create_ink = approach(time_create_ink, time_create_ink_max, time_create_ink_step);