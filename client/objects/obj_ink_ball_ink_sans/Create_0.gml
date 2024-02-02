event_inherited();

if (fight_get_initiative() == 0) exit;

damage = get_char_damage(obj_character_ink_sans);

amount = 96;

source = time_source_create(time_source_game, 1/12, time_source_units_seconds, function () {
	var inst_drop = choose(obj_drop_ink_sans, obj_drop_ink_sans,
							obj_drop_orange_ink_sans,
							obj_drop_black_ink_sans);	
	create_drop(x, y, inst_drop, 1.8, random_range(0, 360), false);
}, [], amount);

time_source_start(source);