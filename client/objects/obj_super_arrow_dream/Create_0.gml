event_inherited();

spwan_stars = function () {
var angle = 360 / 10;
	var i = angle;
	
	while (i <= 360) {
		var	star_x = dcos(i); 
		var	star_y = -dsin(i); 

		var star = instance_create_depth(x + star_x, y + star_y, fight_depth.bullet_outside, obj_little_star_dream, {
			direction: fight_random_integer(0, 360)	
		});
	
		star.speed_const = speed_const - fight_random_integer(0, 0.5);
		i += angle;
	}	
	
	
}


result_ricochet = function () {
	spwan_stars();
	time_source_start(time_source_spwan_stars);
}


collision = function () {
	var collision_border =  function () {
		result_ricochet();	
		be_ricochet = true;
	};
	
	if (place_meeting(x + lengthdir_x(speed_const + 1, image_angle), y, obj_solid)) {
		collision_border();
	};
	if (place_meeting(x, y + lengthdir_y(speed_const + 1, image_angle), obj_solid)) {
		collision_border();
	};	
}

time_source_spwan_stars = time_source_create(time_source_game, 30 / 60, time_source_units_seconds, spwan_stars, [], 2);
