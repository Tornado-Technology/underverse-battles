if (!can_move) exit;

speed_const = approach(speed_const, speed_max, 0.05 * dtime);
speed_spinning = speed_const;

image_angle += (speed_spinning * dtime) % 360;
