event_inherited();

depth = fight_depth.bullet_outside_hight;

_speed = 2;
additional_speed = 0;
delta_speed = 0;
delta_speed_between_mini_fireball = 4;
target_position_offset = 20;
count_mini_fireballs = 6;

is_moving = true;
target_position = undefined;
_angle = 0;

spawn_mini_fireballs = function() {
	var delta_angle = 360 / count_mini_fireballs;
	
	for (var i = delta_angle; i <= 360; i += delta_angle) {
		var instance = instance_create_depth(x, y, depth, obj_projectile_curve_mini_fireball);
		instance.damage = damage;
		instance.soul_invulnerability = soul_invulnerability;
		instance.base_angle = i;
		instance.line_speed = _speed + delta_speed_between_mini_fireball;
		instance.base_angle_speed = 10;
		instance.depth = depth;
	}
}

alarm[0] = 1;
