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

create_border(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
pattern_instances = [
	create_pattern_custom_power(obj_pattern_flying_bones, 3, {
		bone: obj_bone_sharp_error_sans_anti_piracy,
		sides: [dir.left, dir.right],
		is_aiming: false,
		custom_period: 6,
		custom_repeats: 80
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_aiming_gasterblasters, 5, {
		soul_type: battle_soul_type.red,
		gasterblaster_aiming: obj_gasterblaster_aiming_error_sans_anti_piracy,
		count: 5,
		custom_repeats: 5
	})
];