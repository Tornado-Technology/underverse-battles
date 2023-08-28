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
	create_pattern_custom_power(obj_pattern_spinning_bone_cross_ultimate, 4, {
		bone: obj_bone_topref_cross,
		bone_spinning: obj_bone_rotating_cross,
		gasterblaster_aiming: obj_gasterblaster_aiming_cross
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_aiming_gasterblasters, 3, {
		soul_type: battle_soul_type.blue,
		gasterblaster_aiming: obj_gasterblaster_aiming_cross,
		count: 2,
		custom_repeats: 4
	})
];