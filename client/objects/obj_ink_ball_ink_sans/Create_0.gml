event_inherited();

damage = get_char_damage(obj_character_ink_sans);

amount = 96;

source = time_source_create(time_source_game, 1/12, time_source_units_seconds, function () {
	var inst_drop = fight_random_choose(obj_drop_ink_sans, obj_drop_ink_sans, obj_drop_ink_sans,
							obj_drop_orange_ink_sans, obj_drop_black_ink_sans, obj_drop_cyan_ink_sans, obj_drop_blue_ink_sans);	
	create_drop(x, y, inst_drop, 1.8, fight_random_float(0, 360), false);
}, [], amount);

time_source_start(source);