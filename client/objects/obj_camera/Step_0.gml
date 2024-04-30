camera_position = new Vector2(camera_get_view_x(_camera), camera_get_view_y(_camera));
camera_angle = camera_get_view_angle(_camera);

// Target
event_user(1);

// Overwrite
event_user(2);

// Zoom
event_user(3);

var new_position = camera_position.copy();

// Following
if (following_traget) {
	if (!is_using_speed) {
		new_position.x = target_position.x;
		new_position.y = target_position.y;
	}
	else {
		new_position.x = round(approach(new_position.x, target_position.x, _speed.x));
		new_position.y = round(approach(new_position.y, target_position.y, _speed.y));
	}
}

// Zoom
new_position = new Vector2(new_position.x + (zoom_target.x - new_position.x) * (zoom - 1) / zoom, new_position.y + (zoom_target.y - new_position.y) * (zoom - 1) / zoom);

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