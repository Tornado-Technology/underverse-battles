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

create_border(battle_border.up - 20, battle_border.down, battle_border.left - 10, battle_border.right - 10);
pattern_instances = [
	create_pattern_custom_power(obj_pattern_special_nightmare, 4, {
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_tentacles_flies_up, 3, {
		tentacles: obj_tentacles_destroy_back_nightmare
	})
	
];
//create_pattern_custom_power(obj_pattern_creation_trident, 4, {
//		creation: obj_creation_nightmare
//	})