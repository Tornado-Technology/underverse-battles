event_inherited();
image_alpha = 0;
damage = 6;
soul_invulnerability = 20;
speed_count = 0;
radius_max = point_distance(x, y, center_x, center_y);
radius = radius_max;
step = 0.5;
angle = 0;
angle = image_angle;
time_destory = 40;

is_versa = false;

destroying = false;

moving_radius = true;


impact_on_radius = function () {}

audio_play_sound_plugging(snd_projectile);

time_source_obj_destroy = time_source_create(time_source_game, time_destory / 60, time_source_units_seconds, function () {
	destroying = true;
});
