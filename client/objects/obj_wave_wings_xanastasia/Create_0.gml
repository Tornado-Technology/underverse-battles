event_inherited();

disable_surface = true;

max_alpha = 0.5;
image_alpha = max_alpha;

disappearance = false;

step = 0.1;

speed_const = 0;
speed_feathers = speed_const;

time_source_life = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
	disappearance = true;
});

time_source_start(time_source_life);