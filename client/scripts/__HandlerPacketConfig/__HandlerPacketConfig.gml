global.verify_code_connection = undefined;
global.ping_instance = noone;
global.packet_handler = {};
global.friend_requests = [];
global.friend_accounts = [];

var callback_change_password = function(data) {
	if (data.status != status_code.success) {
		display_show_message_info(translate_get("Menu.Notifications.Error." + string(data.status)), c_red);
		return;
	}
			
	network_account = data.account;
	network_profile = data.profile;
	display_show_message_info(translate_get("Menu.Notifications.PasswordSuccessful"), c_lime);
}

packet_handler_register("connection", function(data) {
    var code = data.code;
	if (code == status_code.success) {
		logger.info("Client connection success.");
		return;
	}
			
	logger.error($"Client connectin rejected, code: {code}.");
	global.network_blocking = true;
	network_disconnect(false);
	display_show_message_status_code(code, status_code.updateRequired, "UpdateRequired", c_red, 380);
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
	global.friend_accounts = [];
});

packet_handler_register("login", function(data) {
	if (data.status == status_code.success) {
		network_profile = data.profile;
		network_account = data.account;
		on_network_login.invoke(data.status);
		
		global.friend_accounts = [];
		send_get_accounts_info(network_profile.friends);
		
		achievement_give(achievement_id.a_cybers_world);
		logger.info("Login success");
		display_show_message_info(translate_get("Menu.Notifications.LoginSuccessful"), c_lime);
		return;
	}

	logger.error($"Login failed. Error: {data.status}");
	display_show_message_info(translate_get("Menu.Notifications.Error." + string(data.status)), c_red);
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
		_id = undefined;
		
		global.verify_code_control = instance_create(obj_verify_code_control);
		global.verify_code_connection = global.verify_code_control.on_data.connect(function(args) {
			if (args[1] != _id) { 
				return; 
			}
			send_verification(args[0]);
			global.verify_code_control.on_data.disconnect(global.verify_code_connection);
		})
				
		_id = get_string_async(translate_get("Menu.SignUp.MessageCode"), "");
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

packet_handler_register("getAccountsInfo", function(data) {
	if (data.status == status_code.success) {
		global.friend_accounts = array_union(global.friend_accounts, struct_get_values(data.profiles));
		return;
	}
});

packet_handler_register("friendRequestGetAll", function(data) {
	global.friend_requests = struct_get_values(data.requests);
	with (obj_profile_friend_requests) update();
});

packet_handler_register("friendRequest", function(data) {
	if (data.code == status_code.success) {
		display_show_message_info(translate_get("Menu.Notifications.RequestSuccessful"), c_lime);
		return;
	}
	display_show_message_info(translate_get("Menu.Notifications.Error." + string(data.code)), c_red);
});

packet_handler_register("friendFightRequest", function(data) {
	if (data.code == status_code.success) {
		display_show_message_info(translate_get("Menu.Notifications.RequestSuccessful"), c_lime);
		return;
	}
	display_show_message_info(translate_get("Menu.Notifications.Error." + string(data.code)), c_red);
});

packet_handler_register("friendRequestInvite", function(data) {	
	if (data.code == status_code.success && instance_exists(obj_menu) && !instance_exists(obj_menu_matchmaking)) {
		if (instance_exists(obj_ui_request)) {
			instance_destroy(obj_ui_request);
		}
		instance_create(obj_ui_request, {
			request_id: data.request._id,
			username_sender: data.request.sender.username,
			type: data.request.type
		});
	}
});

packet_handler_register("friendRequestAccept", function(data) {
	if (data.request.type == request_type.friend) {
		send_get_accounts_info([data.accountId]);
	}
	if (data.request.type == request_type.fight) {
		global.fight_key = data.request._id;
		delete_all_auxiliary_menu_objects();
		instance_create(obj_menu_multiplayer_characters, {
			is_private_fight: true
		});
	}
	display_show_message_info(translate_get("Menu.Notifications.RequestAccepted"), c_lime);
});

packet_handler_register("friendRequestReject", function(data) {
	display_show_message_info(translate_get("Menu.Notifications.RequestRejected"), c_red);
});

packet_handler_register("friendListRemove", function(data) {
	if (data.code == status_code.success) {
		for (var i = 0; i < array_length(global.friend_accounts); i++) {
			if (global.friend_accounts[i].accountId == data.account._id) {
				array_delete(global.friend_accounts, i, 1);
				break;
			}
		}
		display_show_message_info(translate_get("Menu.Notifications.FriendDeletedSuccessful"), c_lime);
		return;
	}
	display_show_message_info(translate_get("Menu.Notifications.Error." + string(data.code)), c_red);
});

packet_handler_register("changeNickname", function(data) {
	if (data.status != status_code.success) {
		display_show_message_info(translate_get("Menu.Notifications.Error." + string(data.status)), c_red);
		return;
	}
			
	network_account = data.account;
	network_profile = data.profile;
	display_show_message_info(translate_get("Menu.Notifications.NicknameSuccessful"), c_lime);
});
packet_handler_register("changeUsername", function(data) {
	if (data.status != status_code.success) {
		display_show_message_info(translate_get("Menu.Notifications.Error." + string(data.status)), c_red);
		return;
	}
			
	network_account = data.account;
	network_profile = data.profile;
	display_show_message_info(translate_get("Menu.Notifications.UsernameSuccessful"), c_lime);
});

packet_handler_register("changePassword", callback_change_password);
packet_handler_register("restorePassword", callback_change_password);

packet_handler_register("changeEmail", function(data) {
	if (data.status != status_code.success) {
		display_show_message_info(translate_get("Menu.Notifications.Error." + string(data.status)), c_red);
		return;
	}
			
	network_account = data.account;
	network_profile = data.profile;
	display_show_message_info(translate_get("Menu.Notifications.EmailSuccessful"), c_lime);
});

packet_handler_register("deleteAccount", function(data) {
	if (data.status != status_code.success) {
		display_show_message_info(translate_get("Menu.Notifications.Error." + string(data.status)), c_red);
		return;
	}
			
	network_account = undefined;
	network_profile = undefined;
	display_show_message_info(translate_get("Menu.Notifications.DeleteSuccessful"), c_lime);
});

packet_handler_register("information", function(data) {
	var config = data.config;
	// TODO: Add TODO)))
});

packet_handler_register("matchmakerPlayerCount", function(data) {
	with (obj_menu_matchmaking) {
		player_count = data.count;
	}
});

packet_handler_register("leaderboard", function(data) {
	obj_leaderboard.list = data.leaderboard;
});

packet_handler_register("fightJoin", function(data) {
	var status = data.status;
	
	if (status != status_code.success) {
		logger.info($"Matchmaking error. Status code {status}");
		display_show_message_info(translate_get("Menu.Notifications.Error." + string(status)), c_red);
		return;
	}
	
	logger.info("Successful join to fight");
	var opponent_data = json_parse(data.data);
	var inst_opponent = instance_create(obj_opponent);
	opponent_set_values(inst_opponent, 1, opponent_data.name, opponent_data.characterId, opponent_data.characterSkinId, opponent_data.rating, opponent_data.type, opponent_data.badge);
	var character_object = global.characters[opponent_data.characterId, opponent_data.characterSkinId].object;
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER2, character_object);
	room_goto(room_fight_1v1);
});

packet_handler_register("fightCharacter", function(data) {
	var character = data.characterId;
	var skin = data.skinId;
			
	var character_object = global.characters[character, skin].object;
	memory_set(MEMORY_TYPE.LOCAL, MEMORY_LOCAL.CHARACTER1, character_object);
});

packet_handler_register("fightInitiative", function(data) {
	// Send obj_fight this info
	logger.debug($"Initiative changed to: {data.initiative}.");
	fight_set_initiative(data.initiative);
});

packet_handler_register("fightAction", function(data) {
	global.fight_instance.player_action[data.playerId] = data.action;
	if (data.action == fight_action_type.empty) return;
	statistics_set_selection_attack_network(data.playerId, data.action);
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
	fight_random_set_seed(data.seed);
	battle_use_extra_action(data.attackIndex);
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
	// Send obj_fight this info
	fight_random_set_seed(data.seed);
	
	fight_set_state(fight_state.battle);
	logger.info("Battle begins");
});

packet_handler_register("fightDodge", function(data) {
	logger.info("Dodging");
	
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
	fight_set_state(fight_state.reset);
	logger.info("Battle finished");
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
});
