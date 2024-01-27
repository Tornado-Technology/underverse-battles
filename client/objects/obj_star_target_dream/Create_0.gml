event_inherited();

depth = fight_depth.bullet_outside_hight;
direction_const = direction;

time_source_target = time_source_create(time_source_game, time_target / 60, time_source_units_seconds, function () {		
	image_angle = direction_const;
	motion_set(direction_const, speed_const * dtime);	
})

time_source_start(time_source_target);