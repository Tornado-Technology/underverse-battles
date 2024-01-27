image_angle = (image_angle + angle_speed * dtime) % 360;
motion_set(direction_const, speed_const * dtime);