// Arguments: fireball

time_to_start_attack = 0;
angle_offset = 60;
radius = 150;

time_source_update = undefined;
is_find_random_position_nead_soul = true;
projectiles = [];

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	array_clear(projectiles);
	
	for (var angle = 0; angle < 360; angle += angle_offset) {
		if (angle + angle_offset > 360) break;
	
		var projectile = instance_create_depth(x, y, fight_depth.bullet_outside, fireball);
		projectile.x = lengthdir_x(radius, angle) + soul_instance.x;
		projectile.y = lengthdir_y(radius, angle) + soul_instance.y;
		projectile.is_disabled_move = true;
		projectile.image_alpha_duration_out = time_to_start_attack;
		projectile._speed = 1;
		projectile.angle = point_direction(projectile.x, projectile.y, soul_instance.x, soul_instance.y);
		
		if (is_find_random_position_nead_soul && fight_random_choose(false, true)) {
			var radius_offset = fight_random_integer(20, 30);
			var random_angle = fight_random_integer(0, 360);
			projectile.x += lengthdir_x(radius_offset, random_angle);
			projectile.y += lengthdir_y(radius_offset, random_angle);
		}
		
		array_push(projectiles, projectile);
	}
	
	var i = 0;	
	repeat (array_length(projectiles)) {
		if (!instance_exists(projectiles[i])) break;
		projectiles[i].is_disabled_move = false;
		projectiles[i].angle = point_direction(projectiles[i].x, projectiles[i].y, soul_instance.x, soul_instance.y);
		i++;
	}
}

var period = 50 - _power * 2;
var reteats = 5 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [], reteats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * (reteats + 1) / 60, time_source_units_seconds, function() {
	instance_destroy();
});