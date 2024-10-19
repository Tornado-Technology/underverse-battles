draw_set_color(c_black);

draw_rectangle(0, 0, -border_width, camera_height - border_width, false);
draw_rectangle(-border_width, 0, camera_width + border_width, -border_width, false);
draw_rectangle(-border_width, camera_height, camera_width + border_width, camera_height + border_width, false);
draw_rectangle(camera_width, 0, camera_width + border_width, camera_height + border_width, false);

draw_reset();