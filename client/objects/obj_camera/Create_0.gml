enum camera_mode {
	moving,
	target,
}

global.camera_instance = id;
sprite_index = noone;

// Postion 
camera_position = new Point(0, 0);
target_position = new Point(0, 0);
is_using_speed = true;

// Resolution
default_view_width = 480;
default_view_height = 270;
view_width = default_view_width;
view_height = default_view_height;

// Zoom
zoom = 1;
zoom_required = 1;
zoom_speed = 1;
has_smooth_zoom = false;

// Going beyond the edges of the room?
is_room_border = true;

// Angle
_angle = 0;
angle = 0;
scale = new Point(3, 3);

// Speed
_speed = new Point(2, 2);
_speed_rotate = 2;

// Mode
mode = camera_mode.moving;
target = new Point(0, 0);
overwrite_position = new Point(0, 0);

// Setup
_camera = view_camera[0];
display_set_gui_size(view_width, view_height);
if (is_desktop) window_set_size(view_width * scale.x, view_height * scale.y);
surface_resize(application_surface, view_width * scale.x, view_height * scale.y);
alarm[0] = 1;

// Shake
shake_position = new Point(0, 0);
shake_power = 0;
shake_time = 0;