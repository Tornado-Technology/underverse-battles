if (!can_move) exit;

image_xscale += scale_speed * dtime;
image_angle = point_direction(x, y, x_dir, y_dir);