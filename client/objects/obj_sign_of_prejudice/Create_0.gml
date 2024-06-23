event_inherited();
colour_one = c_red;
colour_two = c_orange;

disable_surface = true;
end_prejudice = function () {}


destroy = false;

time_source_prejudice = time_source_create(time_source_game, time_prejudice / 60, time_source_units_seconds, function () {
	end_prejudice();
	destroy = true;
});

