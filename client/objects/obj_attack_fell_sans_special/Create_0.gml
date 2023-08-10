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
	create_pattern_custom_power(obj_pattern_blue_attack_four_bones, 4, {
		bone: obj_bone_fell_sans,
		use_gravity_attack: use_gravity_attack,
		custom_repeats: 3
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_directing_bones_from_left_and_right, 3, {
		spining_bone: obj_bone_spinning_fell_sans,
		custom_repeats: 6
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_blue_attack_four_bones, 4, {
		bone: obj_bone_fell_sans,
		use_gravity_attack: use_gravity_attack,
		custom_repeats: 3
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_gasterblasters_strong_barrage, 4, {
		gasterblaster: obj_gasterblaster_fell_sans
	}),
];