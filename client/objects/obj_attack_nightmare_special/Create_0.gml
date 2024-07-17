event_inherited();

pattern_index = 0;
start_next_pattern = function() {
	if (fight_get_player(fight_get_next_initiative()).is_defeated()) {
		finish_attack();
		return;
	};
	
	pattern_instance = pattern_instances[pattern_index];
	pattern_instance.callback();
	pattern_index++;
}

on_border_created = function() {
	start_next_pattern();
}

create_border(battle_border.up - 10, battle_border.down, battle_border.left + 60, battle_border.right + 60);
pattern_instances = [
	create_pattern_custom_power(obj_patterns_monster_nightmare, 4, {
		monster: obj_monster_nightmare,
		bone: obj_bone_nightmare
	})
];
