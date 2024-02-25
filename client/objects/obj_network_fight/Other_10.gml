if (state == fight_state.battle) {
	timer_stop();
	if (initiative == _opponent) {
		instance_create_one(obj_battle, {
			attack_type: attack_type,
		});
		exit;
	}
	instance_create_one(obj_battle);
}

if (state == fight_state.dodge) {
	if (fight_get_initiative() == _opponent) {
		player[you].on_dodged(you);
	}
	if (fight_get_initiative() == you) {
		if (player_is_skipping(you)) {
			player[you].on_skipping(you);
		}
	}
	
	fight_draw_dodge();
	statistics_set_selection_attack_network(you, player_action[you]);
	statistics_set_selection_attack_network(_opponent, player_action[_opponent]);
	statistics_set_damage(0);
	timer_stop();
	state = fight_state.reset;
}

if (state == fight_state.reset) {
	statistics_set_next_step_network();
	timer_start();
	set_next_turn();
	
	state = fight_state.choosing;
}