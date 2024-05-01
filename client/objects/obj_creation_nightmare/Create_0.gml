event_inherited();

damage = get_char_damage(obj_character_nightmare);

image_alpha = 0;
target_position = new Vector2(x, y);

damage = 2;

bonb = function () {
	instance_create_depth(x, y, fight_depth.bullet_outside, obj_explosion_from_creation);
	instance_destroy();
}

time_source_spwan = time_source_create(time_source_game,  20 / 60, time_source_units_seconds, function () {
	var target = point_direction(x, y, obj_battle_soul.x, obj_battle_soul.y);
	create_spike(x, y + -dsin(40) * sprite_height,  obj_bullets_nightmare, 3, target);
}, [], -1);

time_source_start(time_source_spwan);