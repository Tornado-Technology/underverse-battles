event_inherited();
result_ricochet = function () {
	var angle = 360 / 5;
	var i = angle;
	while(i <= 360) {
		var	star_x = dcos(angle); 
		var	star_y = -dsin(angle); 

		var star = instance_create_depth(x + star_x, y + star_y, fight_depth.bullet_outside, obj_star_orange_dream, {
			 direction: irandom(360)	
		});
		
		star.draw_outside_arena = true;
		star.speed_const = speed_const;
	
		i += angle;
	}
	
	destroy = true;
}

