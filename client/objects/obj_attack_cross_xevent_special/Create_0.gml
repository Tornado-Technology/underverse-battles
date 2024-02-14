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
	create_pattern_custom_power(obj_pattern_spinning_bone_cross_ultimate, 4, {
		knife: obj_knife_directed_cross_xevent,
		bone_spinning: obj_bone_rotating_cross_xevent,
		gasterblaster_aiming: obj_gasterblaster_aiming_cross_xevent
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_aiming_gasterblasters, 3, {
		soul_type: battle_soul_type.blue,
		gasterblaster_aiming: obj_gasterblaster_aiming_cross_xevent,
		count: 2,
		custom_repeats: 4
	})
];