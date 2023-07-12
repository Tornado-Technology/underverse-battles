event_inherited();

pattern_index = 0;
start_next_pattern = function() {
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
		bone: obj_bone_sans,
		bone_size: 4.2,
		custom_repeats: 5
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_blue_attack, 4, {
		bone: obj_bone_sans,
		use_gravity_attack: use_gravity_attack,
		is_double: choose(true, false),
		custom_repeats: 3
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_gasterblasters_strong_barrage, 4, {
		gasterblaster: obj_gasterblaster_sans
	}),
];