event_inherited();

disable_surface = true;


image_blend = c_red;
	
destroy = false;

time_source_prejudice = time_source_create(time_source_game, time_prejudice / 60, time_source_units_seconds, function () {
	end_prejudice();
	destroy = true;
});

time_source_start(time_source_prejudice);
