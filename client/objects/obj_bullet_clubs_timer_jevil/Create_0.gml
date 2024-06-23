event_inherited();
image_alpha  = 0;

radius_max = point_distance(x, y, center_x, center_y);
radius = radius_max;


sprite_frame = 0;

attack = false;
length_charge = 0;



time_source_start_attack = time_source_create(time_source_game, time_attack / 60, time_source_units_seconds, function () {

});

time_source_start(time_source_start_attack);
