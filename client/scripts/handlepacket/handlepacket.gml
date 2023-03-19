global.verify_code_connection = undefined;
global.ping_instance = noone;
#macro success "success"
#macro fail "fail"

/// @param {Struct} data - Data from server for handle
function handle_packet(data) {
	var index = string_lower(data.index)	
	
	switch(index) {
		case "connection":
			var code = data.code;
			
			if (code == 100) {
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
			if (data.status == 100) {
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
			if (data.status == 100) {
				successful_registration();
				logger.info("Registration successful! You can login now.");
				break;
			}
			

			failed_registration(data.status);
			logger.error("Registration failed!");
			break;
			
		case "account":
			network_account = data.account;
			break;
			
		case "profile":
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

		case "fight_join":
			var status = data.status;
			var msg = data.msg; 

			if (status == "success") {
				logger.info("Successful join to fight, message: {0}.", msg);
				var opponent_data = json_parse(data.data);
				var inst_opponent = instance_create(obj_opponent);
				opponent_set_values(inst_opponent, 1, opponent_data.name, opponent_data.characterId, opponent_data.skinId, opponent_data.rating, opponent_data.type, opponent_data.badgeId);
				var character_object = global.characters[opponent_data.characterId, opponent_data.skinId].object;
				memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER2, character_object);
				room_goto(room_fight_1v1);
			} 
			break;
		
		// Set object character
		case "fight_character":
			var character = data.characterId;
			var skin = data.skinId;
			logger.debug("Get new characterInfo: {0}.", character);
			
			var character_object = global.characters[character, skin].object;
			memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER1, character_object);
			break;
		
		case "fight_timer":	
			// Send obj_fight this info
			timer_set_time(data.time);
			break;
		
		case "fight_initiative":
			// Send obj_fight this info
			fight_set_initiative(data.init);
			break;

		case "fight_action":
			// Send obj_fight this info
			fight_set_enemy_action(data.enemy, data.action);
			break;
		
		case "fight_power":
			// Send obj_fight this info
			fight_set_enemy_power(data.enemy, data.power);
			break;
			
		case "fight_soul":
			// Send obj_fight this info
			fight_set_soul_data(data.enemy, data.x, data.y, data.ang, data.abil);
			break;
			
		case "battle_start":
			logger.info("battle begins");
			
			// Send obj_fight this info
			random_set_seed(data.seed);
			fight_set_state(fight_state.battle);
			break;
			
		case "fight_dodge":
			logger.info("dodging");
			
			// Send obj_fight this info
			fight_set_state(fight_state.dodge);
			break;
		
		case "fight_hp":
			var data_enemy = data.enemy;
			if (data_enemy != 0) {
				var damage = fight_get_enemy_hp(data_enemy) - data.value;
				if (damage > 0)
					fight_network_damage(data_enemy, damage);
				else if (damage < 0)
					fight_network_heal(data_enemy, -damage);
			}
			
			fight_set_enemy_hp(data_enemy, data.value);
			break;
			
		case "battle_end":
			instance_destroy(attack_creator_xchara);
			
		case "fight_mana":
			fight_set_enemy_mana(data.enemy, data.value);
			break;
			
		case "fight_stamina":
			fight_set_enemy_stamina(data.enemy, data.value);
			break;
			
		case "fight_stun":
			fight_network_stun(data.enemy);
			break;
			
		case "collider_soul":
			fight_network_collider(data.enemy);
			break;
			
		case "fight_disconnect":
			instance_destroy(obj_network_fight_ui_disconnect);
			fight_network_disconnect(data.enemy);
			fight_timer_set_state(TIMER_STATE.STOP);
			break;
			
		case "fight_finished":
			instance_destroy(obj_network_fight_ui_disconnect);
			fight_network_finished(data.isWin, data.rating);
			fight_timer_set_state(TIMER_STATE.STOP);
			break;
			
		case "fight_client_remove":
			instance_create_one(obj_network_fight_ui_disconnect);
			fight_timer_set_state(TIMER_STATE.DISABLED);
			break;
			
		case "fight_client_add":
			instance_destroy(obj_network_fight_ui_disconnect);
			fight_timer_set_state(TIMER_STATE.START);
			break;
			
		case "clients_with_state_count":
			var count = data[$ "count"];
			var state = data[$ "state"];
			break;
		
		// Global client freaking out from an invalid command
		default:
			logger.warning("Unknown network command: {0}.", data.index);
			break;
	}
}