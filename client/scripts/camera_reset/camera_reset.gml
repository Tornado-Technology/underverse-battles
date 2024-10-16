function camera_reset() {
	with (obj_camera) {
        zoom = 1;
		view_width = 480;
		view_height = 270;

		camera_position = new Vector2(0, 0);
		overwrite_position = new Vector2(0, 0);
		target_position = new Vector2(0, 0);

		shake_position = new Vector2(0, 0);
		shake_power = 0;
		shake_time = 0;

		display_set_gui_size(view_width, view_height);
		if (is_desktop) window_set_size(view_width * scale.x, view_height * scale.y);
		surface_resize(application_surface, view_width * scale.x, view_height * scale.y);
    }
}