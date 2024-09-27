event_inherited();

disable_surface = true;

damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 20;

image_xscale =  x > obj_battle_soul.x ? -1 : 1;

image_alpha = 0;
target_position = new Vector2(x, y);

destroying = false;

drop = obj_drop_nightmare;

if (!variable_instance_exists(id, "bullets_spawn_period")) bullets_spawn_period = 0.5;

time_source_spwan = time_source_create(time_source_game,  bullets_spawn_period, time_source_units_seconds, function () {
	var drop_direction = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y) + fight_random_float(-5, 5);
	var drop_instance = instance_create_depth(x, y, fight_depth.bullet_outside, drop, {
		speed_const: speed_const + 1,
		direction: drop_direction,
		image_alpha: 1
	});
	drop_instance.disable_surface = true;
	
	audio_play_sound_plugging(snd_spit);
}, [], 3);

time_source_start(time_source_spwan);