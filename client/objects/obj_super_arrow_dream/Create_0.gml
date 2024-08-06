event_inherited();


is_bonb = false;

alpha = 1;
radius = 10;
 alpha_time = 0.05;

spwan_stars = function () {
var angle = 360 / 10;
	var i = angle;
	
	while (i <= 360) {
		var	star_x = dcos(i); 
		var	star_y = -dsin(i); 

		var star = instance_create_depth(x + star_x, y + star_y, fight_depth.bullet_outside, obj_little_star_dream, {
			direction: i
		});
	
		star.speed_const = speed_const - fight_random_integer(0, 0.5);
		i += angle;
	}	
	
	
}


result_ricochet = function () {
	spwan_stars();
}


collision = function () {
	var collision_border =  function () {
		result_ricochet();	
		be_ricochet = true;
		is_bonb = true;
	};
	
	if (place_meeting(x + lengthdir_x(speed_const + 1, image_angle), y, obj_solid)) {
		collision_border();
	};
	if (place_meeting(x, y + lengthdir_y(speed_const + 1, image_angle), obj_solid)) {
		collision_border();
	};	
}

