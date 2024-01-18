event_inherited();

depth = fight_depth.bullet_outside_hight;

speed_max = 5;
speed_boost_max = 0.8;
speed_boost = 0;
t = 0;
_speed = 0;
angle = 0;

time_to_destroy = 6;
image_alpha = 0;
event_id = 0;
is_started_moving = false

target_position = Vector2.zero();

fireball = instance_create_depth(x, y, depth, obj_projectile_mini_fireball)
fireball.x = x
fireball.y = y
fireball.image_alpha_duration_out = 2;
fireball.on_ready = function() {
	fireball.angle = point_direction(x, y, soul_instance.x, soul_instance.y);
}

fireball.on_update = function() {
	
}

time_source_to_destroy = time_source_create(time_source_game, time_to_destroy, time_source_units_seconds, function() {
	//instance_destroy(id);
	time_source_destroy(time_source_to_destroy);
});

time_source_start(time_source_to_destroy);
