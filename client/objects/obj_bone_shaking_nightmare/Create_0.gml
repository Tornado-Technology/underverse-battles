event_inherited();


damage = get_char_damage(obj_character_nightmare);

soul_invulnerability = 20;

is_shaking = false;
shake_power = 1;
shake_position = new Vector2();

time_source_shake_exists = false;
shake = function() {
	is_shaking = true;
	time_source_shake = time_source_create(time_source_game, 1/6, time_source_units_seconds, function () {
		is_shaking = false;
	});
	time_source_shake_exists = true;
	time_source_start(time_source_shake);
}