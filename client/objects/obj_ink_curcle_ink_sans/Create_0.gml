event_inherited();

damage = get_char_damage(obj_character_ink_sans);

is_disappearing = false;
source = time_source_create(time_source_game, 1/6, time_source_units_seconds, function () {
	is_disappearing = true;
});

time_source_start(source);