event_inherited();

speed_spinning = elemen.speed_const;
scale_const = elemen.scale_const;
time_source_destroy_tentacles = time_source_create(time_source_game, time_destroy / 60, time_source_units_seconds, function () {});
time_source_start(time_source_destroy_tentacles);