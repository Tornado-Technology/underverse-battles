event_inherited();

// Type
color_type = battle_soul_type.yellow;

can_shoot = true;
shoot_projectile = obj_battle_soul_yellow_projectile;
shoot_cooldown = 0.1; // Seconds
shoot_timer = time_source_create(time_source_game, shoot_cooldown, time_source_units_seconds, function() {
	can_shoot = true;
}, [], 1);

shoot = function() {
	if (!can_shoot) return;
	
	// Create projectile
	var projectile_sprite = object_get_sprite(shoot_projectile);
	var projectile_bbox_left = sprite_get_bbox_left(projectile_sprite);
	var projectile_offset = sprite_get_width(projectile_sprite) - projectile_bbox_left;
	var projectile_x = x + cos(degtorad(image_angle)) * projectile_offset;
	var projectile_y = y - sin(degtorad(image_angle)) * projectile_offset;
	instance_create_depth(projectile_x, projectile_y, fight_depth.bullet_outside_hight, shoot_projectile, {
		image_angle: image_angle
	});
	
	// Cooldown
	can_shoot = false;
	time_source_start(shoot_timer);
}
