event_inherited();

pattern_index = 0;
start_next_pattern = function() {
	if (fight_get_player(fight_get_next_initiative()).is_defeated()) {
		finish_attack();
		return;
	}
	
	pattern_instance = pattern_instances[pattern_index];
	pattern_instance.callback();
	pattern_index++;
}

on_border_created = function() {
	start_next_pattern();
}

create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
pattern_instances = [
	create_pattern_custom_power(obj_pattern_blue_attack, 4, {
		bone: obj_bone_sans,
		use_gravity_attack: use_gravity_attack,
		is_double: false,
		custom_repeats: 3
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_two_bones, 4, {
		soul_type: battle_soul_type.red,
		bone: obj_bone_sans,
		bone_size: 3,
		side_is_changing: false,
		custom_repeats: 5
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_blue_attack, 4, {
		bone: obj_bone_sans,
		use_gravity_attack: use_gravity_attack,
		is_double: fight_random_choose(true, false),
		custom_repeats: 3
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_gasterblasters_strong_barrage, 4, {
		gasterblaster: obj_gasterblaster_sans,
		reversed: false
	}),
];