image_angle = point_direction(x, y, x_dir, y_dir);

if (image_xscale < sqrt(room_width * room_width + room_height * room_height)) {
	image_xscale += scale_speed;
}
