event_inherited();

disable_surface = true;

damage = get_char_damage(obj_character_nightmare);


soul_invulnerability = 20;

image_xscale =  x > obj_battle_soul.x ? -1 : 1;

image_alpha = 0;
target_position = new Vector2(x, y);

damage = 2;

destroying = false;

drop = obj_drop_nightmare;

if (!variable_instance_exists(id, "bullets_spawn_period")) bullets_spawn_period = 0.5;

time_source_spwan = time_source_create(time_source_game,  bullets_spawn_period, time_source_units_seconds, function () {
	var target = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y);
	create_spike(x, y + -dsin(40) * sprite_height,  drop, speed_const + 1, target, {
		disable_surface: true
	});
}, [], 3);

time_source_start(time_source_spwan);