event_inherited();

disable_surface = true;
end_prejudice = function () {}

radius = 10;
angle = 360;
point_in_circum = 1;
 aim_count = (point_in_circum * 2);


draw_directions = function () {	

	var ang = (angle / aim_count);
	var _xx;
	var _yy;
	var i = ang;
	
	while(i <= 360) {
	 _xx = x + dcos(i) * radius;
	 _yy = y + -dsin(i) * radius;
	 
		draw_sprite_ext(spr_aim_hit_line, 0, _xx , _yy, 2, 2, i, c_white, 1);
		i += ang;
	}
	
}


destroy = false;

time_source_prejudice = time_source_create(time_source_game, time_prejudice / 60, time_source_units_seconds, function () {
	end_prejudice();
	destroy = true;
});

time_source_start(time_source_prejudice);
