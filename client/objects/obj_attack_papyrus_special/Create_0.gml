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

create_border(battle_border.up - 20, battle_border.down - 20, battle_border.left + 20, battle_border.right + 20);
pattern_instances = [
	create_pattern_custom_power(obj_pattern_aiming_gasterblasters_1, 4, {
		soul_type: battle_soul_type.blue,
		bone: obj_bone_shaking_papyrus	
	})
	
	
];