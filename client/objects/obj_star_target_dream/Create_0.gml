event_inherited();

draw_outside_arena = true;
depth = fight_depth.bullet_outside_hight;


time_source_target = time_source_create(time_source_game, time_target / 60, time_source_units_seconds, function () {		
	image_angle = direction;
	motion_set(direction, speed_const * dtime);	
})

time_source_start(time_source_target);