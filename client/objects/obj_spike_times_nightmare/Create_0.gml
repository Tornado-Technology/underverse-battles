event_inherited();

damage = get_char_damage(obj_character_nightmare);
soul_invulnerability = 20;



time_source_charger = time_source_create(time_source_game, time_charget, time_source_units_seconds, function () {
	y = lerp(y, charger, 0.2 * dtime);
});

time_source_attack = time_source_create(time_source_game, 10 / 60, time_source_units_seconds, function () {
	motion_set(direction, speed_const * dtime);
});

time_source_start(time_source_charger);