event_inherited();

disable_surface = true;



alpha = 0;

disappearance = false;

step = 0.1;

speed_const = 0;
speed_feathers = speed_const;

time_source_life = time_source_create(time_source_game, 30 / 60, time_source_units_seconds, function () {});

time_source_start(time_source_life);