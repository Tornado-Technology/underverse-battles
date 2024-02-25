event_inherited();
result_ricochet = function () {
	var i = 0;
	repeat(_power + 1) {	
		var angle_offset = image_angle;
		var radius = sprite_width;
		var	star_x = dcos(angle_offset) * radius;
		var	star_y = -dsin(angle_offset) * radius;	
		
		var star = instance_create_depth(x + star_x, y + star_y, fight_depth.bullet_outside, obj_star_orange_dream);
		
		star.draw_outside_arena = true;
		star.direction_const = irandom_range(1, 360);
		star.speed_const = speed_const;
	}
	
	while(image_alpha >= 0) {
		image_alpha -= 0.01;
	}
	
	if (image_alpha == 0) {
		instance_destroy();
	}
}
