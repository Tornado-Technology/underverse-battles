/// @desc Fight update
if (pause) exit;

event_user(15); // Ai

// Called in fight_update_state()

// TODO: Update AI in fight_set_enemy_action / fight_reset_enemy_action
// TODO: Remake timer

switch(state) {
	case fight_state.wait:
		break;

	case fight_state.choosing:
		if (fight_enemys_chosen()) break;
			
			timer_stop();
			
			var current_enemy = fight_get_initiative();
			
			if (!fight_enemy_skip()) {
				// TODO: add method fight_remove_enemy_stamina_cost
				// TODO: add method fight_remove_enemy_mana_cost
				// TODO: add method fight_remove_enemy_stats_cost
				fight_remove_enemy_stamina(current_enemy, fight_get_enemy_action_stamina_cost(current_enemy, enemy_action[current_enemy]));
				fight_remove_enemy_mana(current_enemy, fight_get_enemy_action_mana_cost(current_enemy, enemy_power[current_enemy]));
			}
			else
				fight_get_enemy(current_enemy).on_skipping(current_enemy);
			
			statistics_set_selection_attacks(fight_get_enemy_action(0), fight_get_enemy_action(1));
			var dodged = fight_enemys_defended() || fight_enemy_skip();
			fight_set_state(dodged ? fight_state.dodge : fight_state.battle);
		break;

	case fight_state.dodge:
		fight_draw_dodge();
		statistics_set_damage(0);

		// Do reset
		fight_set_state(fight_state.reset);
		break;

	case fight_state.battle:
		// If that AI turn and us attack is really attacking then
		if (1 - initiative == 1 && fight_enemy_action_is_attack()) {
			
			// Make hurt AI
			with (obj_ai) {
				event_user(11);
				fight_enemy_hurt(1, _damage);
				fight_draw_damage_number(1, _damage);
				statistics_set_damage(_damage);
			}
			
			var type = fight_get_enemy_action_type(initiative, enemy_action[initiative]);
			if (type != fight_action_type.attack_with_healing) {
				// Do reset
				fight_set_state(fight_state.reset);
				break;
			}
		}
			
		// Create battle
		instance_create_one(obj_battle);
		break;

	case fight_state.reset:
		// Regen stamina both enemys if someone skiping
		if (fight_enemy_skip()) {
			fight_regen_enemys_stamina();
		} 
		
		// Regen stamina dodged enemy
		if (fight_enemys_defended()) {
			var next = fight_get_next_initiative();
			fight_regrn_enemy_stamina(next)
		}
		
		// Some reset actions
		fight_reset_fight_ui();
		fight_set_next_initiative();
		
		// Reset actions
		fight_reset_enemys_action();
		fight_reset_enemys_power();
		
		// Return to choosing
		fight_set_state(fight_state.choosing);
		break;
		
	case fight_state.ending:
		// TODO: Maybe me need destroy this obj, but idk 
		// Go to gameover screen
		global.fight_instance = noone;
		room_goto(room_fight_end);
		break;

	default:
		logger.warning("Fight update failed, resone: undefined state: \"{0}\".", state);
		break;
}