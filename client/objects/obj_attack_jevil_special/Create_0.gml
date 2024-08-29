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

create_border(battle_border.up - 10, battle_border.down - 10, battle_border.left - 10, battle_border.right - 10);
pattern_instances = [
	create_pattern_custom_power(obj_pattern_carousel, 3, {
		carousel: obj_carousel_jevil
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_falling_scythe_teleport, 3, {
		teleport: obj_teleport_jevil,
		scythe: obj_scythe_falling_jevil
	}, start_next_pattern),
	create_pattern_custom_power(obj_pattern_scythe_small_box, 3, {
		box: obj_box_jevil,
		sprite_spades_box: spr_jevil_spades_box,
		sprite_clubs_box: spr_jevil_clubs_box,
		scythe: obj_turning_scythe_jevil
	})
];