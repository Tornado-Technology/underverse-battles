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
	 create_pattern_custom_power(obj_pattern_special_xanastasia, 1, {
	 }, start_next_pattern),
	 create_pattern_custom_power(obj_pattern_swords_moving_down, 4, {
		 scythe:  obj_scythe_xanastasia,
		 swords: obj_swords_xanastasia
	}, start_next_pattern),
	 create_pattern_custom_power(obj_pattern_accelerating_left_right_moving_feathers, 3, {
		feathers:  obj_feathers_xanastasia
	})
];


