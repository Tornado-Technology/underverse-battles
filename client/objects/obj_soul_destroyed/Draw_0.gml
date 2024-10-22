draw_set_color(c_black);
draw_rectangle(
	obj_camera.camera_position.x,
	obj_camera.camera_position.y,
	obj_camera.camera_position.x + obj_camera.view_width,
	obj_camera.camera_position.y + obj_camera.view_height,
	false
);
draw_self();

draw_reset();