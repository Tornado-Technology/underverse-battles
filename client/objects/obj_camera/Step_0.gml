camera_position = new Point(camera_get_view_x(_camera), camera_get_view_y(_camera));
camera_angle = camera_get_view_angle(_camera);

// Zoom
event_user(3);

// Target
event_user(1);

// Overwrite
event_user(2);

var new_position = camera_position;

// Following
if (!is_using_speed) {
	new_position.x = target_position.x;
	new_position.y = target_position.y;
}
else {
	new_position.x = round(approach(new_position.x, target_position.x, _speed.x));
	new_position.y = round(approach(new_position.y, target_position.y, _speed.y));
}

if (is_room_border) {
	new_position.x = clamp(new_position.x, 0, room_width - view_width);
	new_position.y = clamp(new_position.y, 0, room_height - view_height);
}

// Shake
shake_position.x = 0;
shake_position.y = 0;
if (shake_time > 0) {
	shake_time = approach(shake_time, 0, 1);
	shake_position.x = irandom_range(-shake_power, shake_power);
	shake_position.y = irandom_range(-shake_power, shake_power);
}

camera_set_view_pos(_camera, new_position.x + shake_position.x, new_position.y + shake_position.y);
camera_set_view_angle(_camera, _angle);
camera_set_view_size(_camera, view_width, view_height);

// Fullscreen
event_user(15);

// Audio listener
audio_listener_position(new_position.x + view_width / 2, new_position.y + view_height / 2, 0);