event_inherited();

disable_surface = true;
end_prejudice = function () {}

max_xscale = room_width  * 6;
image_xscale = max_xscale;
stage = 0;

max_xscale = 55;
max_yscale = 5;

image_yscale = 0.5;

image_angle = angle;

is_destroing = false;

time_source_prejudice = time_source_create(time_source_game, time_prejudice / 60, time_source_units_seconds, function () {
	end_prejudice();
	is_destroing = true;
});

time_source_start(time_source_prejudice);
