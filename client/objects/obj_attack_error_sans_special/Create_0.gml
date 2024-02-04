event_inherited();

pattern_index = 0;
start_next_pattern = function() {
	if (fight_get_player(fight_get_next_initiative()).is_defeated()) {
		finish_attack();
	}
	
	pattern_instance = pattern_instances[pattern_index];
	pattern_instance.callback();
	pattern_index++;
}

on_border_created = function() {
	start_next_pattern();
}

create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
pattern_instances = [
	create_pattern_custom_power(obj_pattern_flying_bones, 6, {
		bone: obj_bone_sharp_error_sans,
		sides: [dir.left, dir.right],
		is_aiming: false,
		custom_repeats: 75
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_aiming_gasterblasters, 4, {
		soul_type: battle_soul_type.red,
		gasterblaster_aiming: obj_gasterblaster_aiming_error_sans,
		count: 3,
		custom_repeats: 6
	})
];