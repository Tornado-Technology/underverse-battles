function point_in_rectangle_gui_multi_touch(x1, y1, x2, y2) {
	for (var i = 0; i < max_touches; i++) {
		var x_mouse = device_mouse_x_to_gui(i);
		var y_mouse = device_mouse_y_to_gui(i);
		
		if (point_in_rectangle(x_mouse, y_mouse, x1, y1, x2, y2)) return i;
	}
		
	return;
}