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
	create_pattern_custom_power(obj_pattern_carousel, 3, {}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_falling_scythe_teleport, 3, {}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_scythe_small_box, 3)
];