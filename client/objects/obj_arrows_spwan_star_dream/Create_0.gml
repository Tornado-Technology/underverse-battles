event_inherited();
result_ricochet = function () {
	
	var radius = 0;
	var angle = 360 / 5;
	var i = angle;
	while(i <= 360) {
		var	star_x = dcos(angle) * radius;
		var	star_y = -dsin(angle) * radius;	
		
		var star = instance_create_depth(x + star_x, y + star_y, fight_depth.bullet_outside, obj_little_star_dream);
		
		star.draw_outside_arena = true;
		star.direction_const = irandom_range(1, 360);
		star.speed_const = speed_const;
		i += angle;
	}
	while(image_alpha >= 0) {
		image_alpha -= 0.01;
	}
	
	if (image_alpha == 0) {
		instance_destroy();
	}
	
}
