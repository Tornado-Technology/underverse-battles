if (!can_move) exit;


image_angle =  point_direction(x, y, x_dir, y_dir) - 180;
image_xscale += scale_speed * dtime / 2;