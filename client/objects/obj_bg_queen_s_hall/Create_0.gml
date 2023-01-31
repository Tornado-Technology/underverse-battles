sprite_index = noone;

layer_bg = layer_create(99, "Main BG");
bg = layer_background_create(layer_bg, spr_background_queen_s_hall);

frame = 0;
frame_max = 3;

_time = 0;
_time_max = convert_seconds_to_steps(0.3);