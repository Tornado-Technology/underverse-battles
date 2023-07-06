event_inherited();

time_to_start_attack = 0;
angle_offset = 50;
radius = 150;

time_source_to_start_attack = undefined
is_find_random_position_nead_soul = true;
projectiles = [];

callback = function() {
	// Activate the move
	time_source_to_start_attack = time_source_create(time_source_game, time_to_start_attack, time_source_units_seconds, function() {
		var i = 0;
		
		repeat (array_length(projectiles)) {
			if (!instance_exists(projectiles[i])) break;
			projectiles[i].is_disabled_move = false;
			projectiles[i].angle = point_direction(projectiles[i].x, projectiles[i].y, soul_instance.x, soul_instance.y);
			i++;
		}
	
		instance_destroy();
		time_source_destroy(time_source_to_start_attack);
	});
	
	// Creating bullets
	for (var angle = 0; angle < 360; angle += angle_offset) {
		if (angle + angle_offset > 360) break;
	
		var projectile = create_projectile(x, y, obj_projectile_mini_fireball);
		projectile.x = lengthdir_x(radius, angle) + soul_instance.x;
		projectile.y = lengthdir_y(radius, angle) + soul_instance.y;
		projectile.is_disabled_move = true;
		projectile.image_alpha_duration_out = time_to_start_attack;
		projectile._speed = 1;
		projectile.angle = point_direction(projectile.x, projectile.y, soul_instance.x, soul_instance.y);
		
		if (is_find_random_position_nead_soul && choose(false, true)) {
			var radius_offset = irandom_range(20, 30);
			var random_angle = irandom_range(0, 360);
			projectile.x += lengthdir_x(radius_offset, random_angle);
			projectile.y += lengthdir_y(radius_offset, random_angle);
		}
		
		array_push(projectiles, projectile);
	}
	
	time_source_start(time_source_to_start_attack);
}