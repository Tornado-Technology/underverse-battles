/// @desc Fight update
if (pause) exit;

switch(state) {
	case fight_state.wait:
		break;

	case fight_state.choosing:
		if (player_are_selecting(0)) break;
		fight_set_state(fight_state.battle);
		break;
	case fight_state.battle:
		// Create battle
		instance_create_one(obj_battle, {
			attack_type: type
		});
		break;
	
	case fight_state.reset:
		// Some reset actions
		fight_reset_fight_ui();
		reset_players_action();
		player[0].special_action.percent = 100;
		
		// Return to choosing
		fight_set_state(fight_state.choosing);
		break;

	default:
		logger.warning($"Fight update failed, resone: undefined state: \"{state}\".");
		break;
}