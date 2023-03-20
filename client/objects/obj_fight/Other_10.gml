/// @desc Fight update
if (pause) exit;

if (player_are_selecting(1)) {
	var player_id_current = initiative;
	if (player_id_current == 1)
		ai_select_attack();
	else
		ai_select_dodge();
}

switch(state) {
	case fight_state.wait:
		break;

	case fight_state.choosing:
		if (players_are_selecting()) break;
			
			timer_stop();
			
			var player_id_current = initiative;
			if (player_is_acting(player_id_current)) {
				fight_remove_player_stamina(player_id_current, fight_get_player_action_stamina_cost(player_id_current, fight_get_player_action(player_id_current)));
				fight_remove_player_mana(player_id_current, fight_get_player_action_mana_cost(player_id_current, fight_get_player_power(player_id_current)));
			}
			else if (player_is_skipping(player_id_current))
				player[player_id_current].on_skipping(player_id_current);
				
			fight_player_add_special_action_percent(player_id_current);
			
			statistics_set_selection_attacks(player_action[you], player_action[_opponent]);
			
			var dodged = players_dodged(you, _opponent) || player_is_skipping(player_id_current);
			fight_set_state(dodged ? fight_state.dodge : fight_state.battle);
		break;

	case fight_state.dodge:
		var player_id_dodging = 1 - initiative;
		player[player_id_dodging].on_dodged(player_id_dodging);
		fight_draw_dodge();
		statistics_set_damage(0);

		// Do reset
		fight_set_state(fight_state.reset);
		break;

	case fight_state.battle:
		// If that AI turn and us attack is really attacking then
		if (initiative == you) {
			if (!player_is_special_acting(you) || player_is_special_acting(you) && fight_get_player_special_action_is_damage_attack(you))
			{
				var damage = ai_make_damage();
				fight_draw_damage_number(1, damage);
				statistics_set_damage(damage);
			
				fight_set_state(fight_state.reset);
				break;
			}
		}
			
		// Create battle
		instance_create_one(obj_battle);
		break;
	
	case fight_state.reset:
		// Regen stamina both players if someone skiping
		if (player_is_skipping(initiative)) {
			fight_regen_players_stamina();
		} 
		
		// Regen stamina dodged player
		if (players_dodged(you, _opponent)) {
			fight_regrn_player_stamina(fight_get_next_initiative());
		}
		
		// Some reset actions
		fight_reset_fight_ui();
		set_next_initiative();
		reset_players_action();
		
		timer_start();
		
		// Return to choosing
		fight_set_state(fight_state.choosing);
		break;

	default:
		logger.warning("Fight update failed, resone: undefined state: \"{0}\".", state);
		break;
}