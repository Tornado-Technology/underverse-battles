global.verify_code_connection = undefined;
global.ping_instance = noone;

/// @param {Struct} data - Data from server for handle
function handle_packet(data) {
	var index = data.index;
	
	switch(index) {
		case "connection":
			var code = data.code;
			if (code == status_code.success) {
				logger.info("Client connection success.");
				break;
			}
			
			logger.error("Client connectin rejected, code: {0}.", code);
			global.network_blocking = true;
			network_disconnect(false);
			display_show_message_info("Connection Rejected[" + string(code) + "]", c_red);
			break;
		
		case "ping":
			if (global.ping_instance != noone) {
				global.ping_instance.connect_timeout_timer.reset();
			}
			send_pong(data.time);
			break;
			
		case "pong":
			network_ping = round(get_timer() / 1000) - data.time;
			break;

		case "logout":
			network_profile = undefined;
			network_account = undefined;
			break;

		case "login":
			if (data.status == status_code.success) {
				network_profile = data.profile;
				network_account = data.account;
				logger.info("Login success");
				display_show_message_info(translate_get("Menu.LogInMessage.LoginSuccessful"), c_lime);
				on_network_login.invoke(data.status);
				break;
			}

			logger.error("Login failed. Error: ", data.status);
			display_show_message_info(translate_get("Menu.LogInMessage.Error")[data.status - 300], c_red);
			on_network_login.invoke(data.status);
			break;

		case "register":
			if (data.status == status_code.success) {
				successful_registration();
				logger.info("Registration successful! You can login now.");
				break;
			}
			

			failed_registration(data.status);
			logger.error("Registration failed!");
			break;
			
		case "schemes":
			network_account = data.account;
			network_profile = data.profile;
			break;
			
		case "verification":
			if (is_desktop) {
				send_verification(get_string(translate_get("Menu.SignUp.MessageCode"), ""));
				break;
			}
			
			if (is_mobile) {
				_id = undefined;
				
				global.verify_code_connection = global.virtual_keyboard.on_data.connect(function(args) {
					if (args[1] != _id) { 
						return; 
					}
					send_verification(args[0]);
					global.virtual_keyboard.on_data.disconnect(global.verify_code_connection);
				})
				
				_id = get_string_async(translate_get("Menu.SignUp.MessageCode"), "");
			}
			break;
		
		case "changeNickname":
			if (data.status != status_code.success) {
				display_show_message_info(string(data.status), c_red);
				break;
			}
			
			network_account = data.account;
			network_profile = data.profile;
			display_show_message_info("Change nickname successful", c_lime);
			break;

		case "changeUsername":
			if (data.status != status_code.success) {
				display_show_message_info(string(data.status), c_red);
				break;
			}
			
			network_account = data.account;
			network_profile = data.profile;
			display_show_message_info("Change username successful", c_lime);
			break;

		case "changePassword":
			if (data.status != status_code.success) {
				display_show_message_info(string(data.status), c_red);
				break;
			}
			
			network_account = data.account;
			network_profile = data.profile;
			display_show_message_info("Change password successful", c_lime);
			break;

		case "changeEmail":
			if (data.status != status_code.success) {
				display_show_message_info(string(data.status), c_red);
				break;
			}
			
			network_account = data.account;
			network_profile = data.profile;
			display_show_message_info("Change email successful", c_lime);
			break;
			
		case "deleteAccount":
			break;
			
		case "information":
			var config = data.config;
			// TODO: Add TODO)))
			break;
			
		case "fightJoin":
			var status = data.status;

			if (status == status_code.success) {
				logger.info("Successful join to fight");
				var opponent_data = json_parse(data.data);
				var inst_opponent = instance_create(obj_opponent);
				opponent_set_values(inst_opponent, 1, opponent_data.name, opponent_data.characterId, opponent_data.characterSkinId, opponent_data.rating, opponent_data.type, opponent_data.badge);
				var character_object = global.characters[opponent_data.characterId, opponent_data.characterSkinId].object;
				memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER2, character_object);
				room_goto(room_fight_1v1);
			} 
			break;
		
		// Set object character
		case "fightCharacter":
			var character = data.characterId;
			var skin = data.skinId;
			logger.debug("Get new characterInfo: {0}.", character);
			
			var character_object = global.characters[character, skin].object;
			memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER1, character_object);
			break;
		
		case "fightInitiative":
			// Send obj_fight this info
			fight_set_initiative(data.initiative);
			break;

		case "fightAction":
			// Send obj_fight this info
			global.fight_instance.player_action[data.playerId] = data.action;
			fight_update_state();
			break;
		
		case "fightPower":
			// Send obj_fight this info
			fight_set_player_power(data.playerId, data.power);
			break;
		
		case "fightSkip":
			// Send obj_fight this info
			fight_set_player_skip(data.playerId);
			break;
			
		case "fightSpecialAction":
			// Send obj_fight this info
			fight_set_player_special_action(data.playerId);
			break;
			
		case "fightSpecialActionCharge":
			// Send obj_fight this info
			fight_set_player_special_action_persent(data.playerId, data.charge);
			break;
		
		case "fightExtraAction":
			battle_use_extra_action();
			break;
		
		case "fightResetAction":
			fight_reset_player_action(0);
			break;
		
		case "fightResetPower":
			fight_reset_player_power(0);
			break;
			
		case "fightSoul":
			// Send obj_fight this info
			fight_set_soul_data(data.playerId, data.x, data.y, data.angle, data.ability);
			break;
			
		case "battleStart":
			logger.info("Battle begins");
			
			// Send obj_fight this info
			random_set_seed(data.seed);
			fight_set_state(fight_state.battle);
			break;
			
		case "fightDodge":
			logger.info("dodging");
			
			// Send obj_fight this info
			fight_set_state(fight_state.dodge);
			break;
		
		case "fightHp":
			var data_enemy = data.playerId;
			if (data_enemy != 0) {
				var damage = fight_get_player_hp(data_enemy) - data.hp;
				if (damage > 0)
					fight_network_damage(data_enemy, damage);
				else if (damage < 0)
					fight_network_heal(data_enemy, -damage);
			}
			
			fight_set_player_hp(data_enemy, data.hp);
			break;
			
		case "battleEnd":
			instance_destroy(attack_creator);
			break;
			
		case "fightMana":
			fight_set_player_mana(data.playerId, data.mana);
			break;
			
		case "fightStamina":
			fight_set_player_stamina(data.playerId, data.stamina);
			break;
			
		case "fightStun":
			fight_network_stun(data.playerId);
			break;
			
		case "fightColliderSoul":
			fight_network_collider(data.playerId);
			break;
			
		case "fightDisconnect":
			instance_destroy(obj_network_fight_ui_disconnect);
			fight_network_disconnect(data.playerId);
			timer_stop();
			break;
			
		case "fightFinished":
			instance_destroy(obj_network_fight_ui_disconnect);
			fight_network_finished(data.winner, data.rating);
			timer_stop();
			break;
			
		case "fightClientRemove":
			instance_create_one(obj_network_fight_ui_disconnect);
			timer_switch(false);
			break;
			
		case "fightClientAdd":
			instance_destroy(obj_network_fight_ui_disconnect);
			timer_switch(true);
			timer_start();
			break;
		
		// Global client freaking out from an invalid command
		default:
			logger.warning("Unknown network command: {0}.", data.index);
			break;
	}
}