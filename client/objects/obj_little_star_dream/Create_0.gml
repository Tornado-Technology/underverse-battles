event_inherited();

time_source_destroy_star = time_source_create(time_source_game, 30 / 60, time_source_units_seconds, function(){
});
time_source_start(time_source_destroy_star);