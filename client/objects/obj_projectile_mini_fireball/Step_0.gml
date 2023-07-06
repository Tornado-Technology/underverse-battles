on_update()
// Fade
var divider = image_alpha_duration_out == 0 ? 1 : image_alpha_duration_out;
image_alpha = approach(image_alpha, 1, 1 / (divider * game_base_fps / dtime));

if (image_alpha >= 1 && !is_ready) {
	is_ready = true;
	on_ready();
} 

// Moving
if (is_disabled_move) exit;

t = approach(t, 1, 0.01);
speed_boost = bezier.get_point(t);
_speed = approach(_speed, speed_max, speed_boost);

motion_set(angle, _speed)
image_angle += _speed;
