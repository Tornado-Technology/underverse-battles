if (state == fight_state.battle) {
	statistics_set_selection_attacks(fight_get_player_action(0), fight_get_player_action(1));
	instance_create_one(obj_battle);
}

if (state == fight_state.dodge) {
	fight_draw_dodge();
	statistics_set_selection_attacks(fight_get_player_action(0), fight_get_player_action(1));
	statistics_set_damage(0);
	fight_set_state(fight_state.reset);
}

if (state == fight_state.reset) {
	state = fight_state.choosing;
	timer_start();
}