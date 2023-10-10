global.verify_code_connection = undefined;
global.ping_instance = noone;
global.packet_handler = {};

var callback_change_password = function(data) {
	if (data.status != status_code.success) {
		display_show_message_info(translate_get("Menu.LogInMessage.Error." + string(data.status)), c_red);
		return;
	}
			
	network_account = data.account;
	network_profile = data.profile;
	display_show_message_info("Change password successful", c_lime);
}

packet_handler_register("connection", function(data) {
    var code = data.code;
	if (code == status_code.success) {
		logger.info("Client connection success.");
		return;
	}
			
	logger.error("Client connectin rejected, code: {0}.", code);
	global.network_blocking = true;
	network_disconnect(false);
	display_show_message_info("Connection Rejected[" + string(code) + "]", c_red);
});

packet_handler_register("ping", function(data) {
    send_pong(data.time);
});

packet_handler_register("pong", function(data) {
    network_client.calculate_ping(data.time);
});

packet_handler_register("logout", function(data) {
	network_profile = undefined;
	network_account = undefined;
});

packet_handler_register("login", function(data) {
	if (data.status == status_code.success) {
		network_profile = data.profile;
		network_account = data.account;
		logger.info("Login success");
		display_show_message_info(translate_get("Menu.LogInMessage.LoginSuccessful"), c_lime);
		on_network_login.invoke(data.status);
		return;
	}

	logger.error("Login failed. Error: ", data.status);
	display_show_message_info(translate_get("Menu.LogInMessage.Error." + string(data.status)), c_red);
	on_network_login.invoke(data.status);
});

packet_handler_register("register", function(data) {
	if (data.status == status_code.success) {
		successful_registration();
		logger.info("Registration successful! You can login now.");
		return;
	}	

	failed_registration(data.status);
	logger.error("Registration failed!");
});

packet_handler_register("schemes", function(data) {
	network_account = data.account;
	network_profile = data.profile;
});

packet_handler_register("verification", function(data) {
	if (is_desktop) {
		send_verification(get_string(translate_get("Menu.SignUp.MessageCode"), ""));
		return;
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
});

packet_handler_register("changeNickname", function(data) {
	if (data.status != status_code.success) {
		display_show_message_info(translate_get("Menu.LogInMessage.Error." + string(data.status)), c_red);
		return;
	}
			
	network_account = data.account;
	network_profile = data.profile;
	display_show_message_info("Change nickname successful", c_lime);
});
packet_handler_register("changeUsername", function(data) {
	if (data.status != status_code.success) {
		display_show_message_info(translate_get("Menu.LogInMessage.Error." + string(data.status)), c_red);
		return;
	}
			
	network_account = data.account;
	network_profile = data.profile;
	display_show_message_info("Change username successful", c_lime);
});

packet_handler_register("changePassword", callback_change_password);
packet_handler_register("restorePassword", callback_change_password);

packet_handler_register("changeEmail", function(data) {
	if (data.status != status_code.success) {
		display_show_message_info(string(data.status), c_red);
		return;
	}
			
	network_account = data.account;
	network_profile = data.profile;
	display_show_message_info("Change email successful", c_lime);
});

packet_handler_register("deleteAccount", function(data) {
	if (data.status != status_code.success) {
		display_show_message_info(string(data.status), c_red);
		return;
	}
			
	network_account = undefined;
	network_profile = undefined;
	display_show_message_info("Delete account successful", c_lime);
});

packet_handler_register("information", function(data) {
	var config = data.config;
	// TODO: Add TODO)))
});

packet_handler_register("fightJoin", function(data) {
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
});

packet_handler_register("fightCharacter", function(data) {
	var character = data.characterId;
	var skin = data.skinId;
	logger.debug("Get new characterInfo: {0}.", character);
			
	var character_object = global.characters[character, skin].object;
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER1, character_object);
});

packet_handler_register("fightInitiative", function(data) {
	// Send obj_fight this info
	fight_set_initiative(data.initiative);
	fight_set_state(fight_state.reset);
});

packet_handler_register("fightAction", function(data) {
	global.fight_instance.player_action[data.playerId] = data.action;
	statistics_set_selection_attack_network(data.playerId, data.action);
	fight_update_state();
});

packet_handler_register("fightPower", function(data) {
	// Send obj_fight this info
	fight_set_player_power(data.playerId, data.power);
});

packet_handler_register("fightSkip", function(data) {
	// Send obj_fight this info
	fight_set_player_skip(data.playerId);
	statistics_set_selection_attack_network(data.playerId, fight_action_type.skip);
});

packet_handler_register("fightSpecialAction", function(data) {
	// Send obj_fight this info
	fight_set_player_special_action(data.playerId);
	statistics_set_selection_attack_network(data.playerId, fight_action_type.special_attack);
});

packet_handler_register("fightSpecialActionCharge", function(data) {
	// Send obj_fight this info
	fight_set_player_special_action_persent(data.playerId, data.charge);
});

packet_handler_register("fightExtraAction", function(data) {
	battle_use_extra_action();
});

packet_handler_register("fightResetAction", function(data) {
	fight_reset_player_action(0);
});

packet_handler_register("fightResetPower", function(data) {
	fight_reset_player_power(0);
});

packet_handler_register("fightSoul", function(data) {
	// Send obj_fight this info
	fight_set_soul_data(data.playerId, data.x, data.y, data.angle, data.ability);
});

packet_handler_register("battleStart", function(data) {
	logger.info("Battle begins");
			
	// Send obj_fight this info
	random_set_seed(data.seed);
	fight_set_state(fight_state.battle);
});

packet_handler_register("fightDodge", function(data) {
	logger.info("dodging");
			
	// Send obj_fight this info
	fight_set_state(fight_state.dodge);
});

packet_handler_register("fightHp", function(data) {
	var data_enemy = data.playerId;
	if (data_enemy != 0) {
		var damage = fight_get_player_hp(data_enemy) - data.hp;
		if (damage > 0)
			fight_network_damage(data_enemy, damage);
		else if (damage < 0)
			fight_network_heal(data_enemy, -damage);
	}
			
	fight_set_player_hp(data_enemy, data.hp);
});

packet_handler_register("battleEnd", function(data) {
	instance_destroy(obj_character_attack);
});

packet_handler_register("fightMana", function(data) {
	fight_set_player_mana(data.playerId, data.mana);
});

packet_handler_register("fightStamina", function(data) {
	fight_set_player_stamina(data.playerId, data.stamina);
});

packet_handler_register("fightStun", function(data) {
	fight_network_stun(data.playerId);
});

packet_handler_register("fightColliderSoul", function(data) {
	fight_network_collider(data.playerId);
});

packet_handler_register("fightDisconnect", function(data) {
	instance_destroy(obj_network_fight_ui_disconnect);
	fight_network_disconnect(data.playerId);
	timer_stop();
});

packet_handler_register("fightFinished", function(data) {
	instance_destroy(obj_network_fight_ui_disconnect);
	fight_network_finished(data.winner, data.rating);
	timer_stop();
});

packet_handler_register("fightClientRemove", function(data) {
	instance_create_one(obj_network_fight_ui_disconnect);
	timer_switch(false);
});

packet_handler_register("fightClientAdd", function(data) {
	instance_destroy(obj_network_fight_ui_disconnect);
	timer_switch(true);
	timer_start();
});
