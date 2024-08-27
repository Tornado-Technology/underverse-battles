event_inherited();


is_bonb = false;

alpha = 1;
radius = 10;
alpha_time = 0.05;
is_special = true;
angle_shards = 180;

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

spwan_shards = function () {	
	var i = 0;
	repeat(4) {
		instance_create_depth((x + dcos(image_angle) * sprite_width / 1.9 - (i * 9)), y, fight_depth.bullet_outside_hight,  obj_super_shards_arrow_dream, {
			sprite_fram: i,
			direction: image_angle + angle_shards + fight_random_integer(10, 55),
			image_angle: image_angle
		});
		
		i++;
	}
}


result_ricochet = function () {
	if(is_special) {
		spwan_stars();
	};
	
	spwan_shards();
}


collision = function () {
	if (collision_line(x + (half_width), y , x, room_width, obj_solid, false, false) == noone) {
		result_ricochet();	
		be_ricochet = true;
		is_bonb = true;
	};	
}

