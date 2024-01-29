global.verify_code_connection = undefined;
global.ping_instance = noone;
global.packet_handler = {};

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
	if (code == status_code.updateRequired) {
		display_show_message_info(translate_get("Menu.Notifications.UpdateRequired"), c_red, 380);
	}
	else {
		display_show_message_info($"Connection rejected. Status code {code}", c_red, 380);
	}
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
		display_show_message_info(translate_get("Menu.Notifications.LoginSuccessful"), c_lime);
		on_network_login.invoke(data.status);
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
		display_show_message_info(string(data.status), c_red);
		return;
	}
			
	network_account = data.account;
	network_profile = data.profile;
	display_show_message_info(translate_get("Menu.Notifications.EmailSuccessful"), c_lime);
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
	logger.debug($"Get new characterInfo: {character}.");
			
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
	// Send obj_fight this info
	fight_set_state(fight_state.battle);
	logger.info("Battle begins");
});

packet_handler_register("battleCreateBorder", function(data) {
	battle_border_create(data.up, data.down, data.left, data.right);
});

packet_handler_register("battleCreateSoul", function(data) {
	create_other_player_soul(data.x, data.y, data.type);
});

packet_handler_register("battleCreateObject", function(data) {
	switch (data.objectName) {
		case "drop":
			create_drop(data.x, data.y, data.object, data.speed, data.direction, data.useGravity, false);
			break;
		case "broomie":
			create_broomie(data.x, data.y, data.object, data.direction, data.side, data.angleSpeed, data.maxAcceleration, false);
			break;
		case "bone":
			create_bone(data.x, data.y, data.object, data.speed, data.size, data.direction, data.angle, false);
			break;
		case "falling bone":
			create_falling_bone(data.x, data.y, data.object, data.angle, data.direction, data.scale, data.acceleration, false);
			break;
		case "poking bone":
			create_poking_bone(data.x, data.y, data.object, data.speed, data.size, data.direction, false);
			break;
		case "spinning bone":
			create_spinning_bone(data.x, data.y, data.object, data.speed, data.size, data.direction, data.angle, data.angleSpeed, false);
			break;
		case "moving platforms":
			create_moving_platforms(data.x, data.y, data.count, data.scale, data.distance, data.speed, false);
			break;
		case "next moving platform":
			create_next_moving_platform(data.x, data.y, data.count, data.scale, data.distance, data.speed, false);
			break;
		case "gasterblaster":
			create_gasterblaster(data.object, data.x, data.y, data.targetX, data.targetY, data.angle, data.flyTime, data.chargeTime, data.flyoutTime, data.destroyTime, false);
			break;
		case "solo gasterblaster":
			create_solo_gasterblaster(data.x, data.y, data.object, data.targetTime, data.chargeTime, data.destroyTime, false);
			break;
		case "error string":
			create_error_string(data.x, data.y, data.object, data.targetX, data.targetY, data.scaleSpeed, false);
			break;
		case "knife swing":
			create_knife_swing(data.x, data.y, data.object, data.angle, data.distance, false);
			break;
		case "big knife x":
			create_big_knife_x(data.x, data.y, data.object, data.direction, data.angle, data.pointStopX, false);
			break;
		case "big knife y":
			create_big_knife_y(data.x, data.y, data.object, data.direction, data.angle, data.pointStopY, false);
			break;
		case "damage wave":
			create_damage_wave(data.x, data.y, data.object, data.angle, data.speed, false);
			break;
		case "spike":
			create_damage_wave(data.x, data.y, data.object, data.speed, data.direction, false);
			break;
		default:
			create_battle_object(data.x, data.y, data.depth, data.object, data.varStruct, false);
			break;
	}
});

packet_handler_register("battleChangeObjectData", function(data) {
	switch (data.objectName) {
		case "bone":
			if (data.eventName == "move") move_bone(data.instacne, data.speed, data.direction, false);
			if (data.eventName == "scale") scale_bone(data.object, data.scale, data.scale_step, false);
			if (data.eventName == "shake") shake_bone(data.object, false);
		break;
		case "solo gasterblaster":
			if (data.eventName == "change position") change_solo_gasterblaster_position(data.object, data.newX, data.newY, false);
			if (data.eventName == "change target") change_solo_gasterblaster_target(data.object, data.target, false);
		case "big knife":
			if (data.eventName == "move") set_big_knife_move(data.object, data.distance, false);
			if (data.eventName == "move up") set_big_knife_move_up(data.object, false);
			if (data.eventName == "spin") set_big_knife_spin(data.object, data.rotatingSpeed, false);
		break;
	}
});

packet_handler_register("battleDestroyObject", function(data) {
	instance_destroy(data.object);
});

packet_handler_register("battleDestroyObjectArray", function(data) {
	instance_destroy_array(data.array);
});

packet_handler_register("battleDestroyByEdit", function(data) {
	destroy_by_edit(data.object, data.color, data.count, data.distance, false);
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
	logger.info("Battle finished");
	instance_destroy(obj_battle_soul);
	instance_destroy(obj_battle_element);
	battle_border_start_animation("Destroy");
	statistics_set_damage(data.damage);
	fight_set_state(fight_state.reset);
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
