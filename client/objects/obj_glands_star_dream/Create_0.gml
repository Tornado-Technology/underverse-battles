event_inherited();

damage = get_char_damage(obj_character_dream);

stop_spawn = false;
star_count = _power div 2 + 2;
time_spawn = 0.2 / star_count;

spawn_star = function () {
	var angle_offset = image_angle - 180;
	var radius = sprite_width;
	var	star_x = dcos(angle_offset) * radius;
	var	star_y = -dsin(angle_offset) * radius;	
	
	var time_target = 1; 
		
	var star = instance_create_depth(x + star_x, y + star_y, fight_depth.bullet_outside, obj_star_target_dream, {
		time_target : time_target					
	});
			
	if (instance_exists(target)) {
		star.direction = point_direction(star.x, star.y, target.x, target.y);
	};
		
	star.speed_const = random_range(2.5 + _power * 0.1, 3.2) + _power * 0.2;	
}

time_source_spawn_star = time_source_create(time_source_game, time_spawn, time_source_units_seconds, spawn_star, [], star_count);