event_inherited();

disable_surface = true;

damage = get_char_damage(obj_character_nightmare);


soul_invulnerability = 20;

image_xscale =  x > obj_battle_soul.x ? -1 : 1;

image_alpha = 0;
target_position = new Vector2(x, y);

damage = 2;

destroying = false;

bullets = obj_bullets_nightmare;


time_source_spwan = time_source_create(time_source_game,  30 / 60, time_source_units_seconds, function () {
	var target = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y);
	var spike = create_spike(x, y + -dsin(40) * sprite_height,  bullets, speed_const + 1, target);
	spike.disable_surface = true;
}, [], 3);

time_source_start(time_source_spwan);