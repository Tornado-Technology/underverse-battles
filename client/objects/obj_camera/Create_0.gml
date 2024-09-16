//var screen_resolutions = [[640, 360], [1280, 720], [1920, 1080], [2048, 1152], [2560, 1440], [3200, 1800], [3840, 2160], [7680, 4320]];
global.camera_instance = id;
sprite_index = noone;

// Postion 
camera_position = new Vector2(0, 0);
target_position = new Vector2(0, 0);
is_using_speed = true;

// Resolution 
zoom = 1;
zoom_target = new Vector2(0, 0);
view_width = 480;
view_height = 270;

zoom_required = 1;
zoom_speed = 1;
// Going beyond the edges of the room?
is_room_border = true;

// Angle
_angle = 0;
angle = 0;
scale = new Vector2(3, 3);

// Speed
_speed = new Vector2(2, 2);
_speed_rotate = 2;

// Target
following_traget = true;
target = noone;

// Setup
_camera = view_camera[0];
display_set_gui_size(view_width, view_height);
if (is_desktop) window_set_size(view_width * scale.x, view_height * scale.y);
surface_resize(application_surface, view_width * scale.x, view_height * scale.y);
alarm[0] = 1;

// Overwrite
is_overwrite = false;
overwrite_position = new Vector2(0, 0);

// Shake
shake_position = new Vector2(0, 0);
shake_power = 0;
shake_time = 0;