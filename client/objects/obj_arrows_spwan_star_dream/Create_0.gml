event_inherited();

destroy = false;


result_ricochet = function () {
destroy = true;
var angle = 360 / 5;
var i = angle;
	while(i <= 360) {
		var	star_x = dcos(i); 
		var	star_y = -dsin(i); 

		var star = instance_create_depth(x + star_x, y + star_y, fight_depth.bullet_outside, obj_little_star_dream, {
			direction: fight_random_integer(0, 360)	
		});
	
		star.speed_const = speed_const;
		star.disable_surface = true;
		time_source_start(star.time_source_self_destroy);
		i += angle;
	}
	
	destroy = true;
}
