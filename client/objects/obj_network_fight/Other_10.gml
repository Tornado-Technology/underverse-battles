if (state == fight_state.battle) {
	timer_stop();
	instance_create_one(obj_battle);
}

if (state == fight_state.dodge) {
	if (fight_get_initiative() == 1) {
		player[0].on_dodged(0);
	}
	if (fight_get_initiative() == 0) {
		if (player_is_skipping(0)) {
			player[0].on_skipping(0);
		}
	}
	
	fight_draw_dodge();
	statistics_set_damage(0);
	timer_stop();
}

if (state == fight_state.reset) {
	if (!first_reset_was) {
		first_reset_was = true;
	}
	else {
		statistics_set_next_step_network();
		timer_start();
	}
	state = fight_state.choosing;
}