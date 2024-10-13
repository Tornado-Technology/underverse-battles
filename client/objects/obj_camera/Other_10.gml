///@desc Reset size
zoom = 1;
view_width = 480;
view_height = 270;
display_set_gui_size(view_width, view_height);
if (is_desktop) window_set_size(view_width * scale.x, view_height * scale.y);
surface_resize(application_surface, view_width * scale.x, view_height * scale.y);