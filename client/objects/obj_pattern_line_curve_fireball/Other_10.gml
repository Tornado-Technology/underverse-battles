projectile = instance_create_depth(x, y, fight_depth.bullet_outside, fireball);
projectile.image_alpha_duration_out = 2;
projectile.is_auto_destroy = false;

projectile.on_ready = function() {
	target_position = new Vector2(soul_instance.x, soul_instance.y);
	projectile.angle = point_direction(x, y, target_position.x, target_position.y);
	projectile.is_disabled_move = false;
}

projectile.on_update = function() {
	if (point_distance(projectile.x, projectile.y, target_position.x, target_position.y) <= 100) {
		projectile_position = new Vector2(projectile.x, projectile.y);
		instance_destroy(projectile);
		event_user(1);
	}
}