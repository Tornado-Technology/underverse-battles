function camera_reset() {
	with (obj_camera) {
		view_width = default_view_width;
		view_height = default_view_height;
		
		zoom = 1;
		zoom_required = 1;
		zoom_speed = 1;
		zoom_target = new Point(0, 0);

		camera_position = new Point(0, 0);
		overwrite_position = new Point(0, 0);
		target_position = new Point(0, 0);
		
		mode = camera_mode.moving;
		target = new Point(0, 0);
		
		_speed = new Point(2, 2);

		shake_position = new Point(0, 0);
		shake_power = 0;
		shake_time = 0;

		display_set_gui_size(view_width, view_height);
		if (is_desktop) window_set_size(view_width * scale.x, view_height * scale.y);
		surface_resize(application_surface, view_width * scale.x, view_height * scale.y);
    }
}