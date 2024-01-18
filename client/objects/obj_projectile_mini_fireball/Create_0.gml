event_inherited();

depth = fight_depth.bullet_outside_hight;

is_disabled_move = true;
speed_max = 5;
speed_boost_max = 0.8;
speed_boost = 0;
bezier = new CubicBezier(new Vector2(1, 0));
t = 0;
_speed = 0;
is_ready = false
angle = 0;

image_alpha_duration_out = 0;
time_to_destroy = 4;
image_alpha = 0;

on_ready = function() {}
on_update = function() {}

is_auto_destroy = true