event_inherited();

damage = get_char_damage(obj_char_tornado);

image_alpha = 0;
image_xscale = 0.5;
image_yscale = 0.5;

time = 0;
stage = 0;

radius_max = point_distance(x, y, center_x, center_y);
radius = radius_max;

alpha = degtorad(point_direction(x, y, center_x, center_y));

audio_play_sound_once(snd_emergence);