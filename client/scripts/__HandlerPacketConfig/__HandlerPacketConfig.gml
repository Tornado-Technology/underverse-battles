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
	instance_create(obj_network_fight_object_storage);
	logger.info("Battle begins");
});

packet_handler_register("battleCreateBorder", function(data) {
	battle_border_create(data.up, data.down, data.left, data.right);
});

packet_handler_register("battleCreateSoul", function(data) {
	create_other_player_soul(data.x, data.y, data.type);
});

packet_handler_register("battleCreateObject", function(data) {
	switch (data.objectType) {
		case 0:
			global.network_fight_object_storage.push(data.storageIndex, create_drop(data.x, data.y, data.object, data.speed, data.direction, data.useGravity, data.storageIndex, false));
			break;
		case 1:
			global.network_fight_object_storage.push(data.storageIndex, create_broomie(data.x, data.y, data.object, data.direction, data.side, data.angleSpeed, data.maxAcceleration, data.storageIndex, false));
			break;
		case 2:
			global.network_fight_object_storage.push(data.storageIndex, create_bone(data.x, data.y, data.object, data.speed, data.size, data.direction, data.angle, data.storageIndex, false));
			break;
		case 3:
			global.network_fight_object_storage.push(data.storageIndex, create_falling_bone(data.x, data.y, data.object, data.angle, data.direction, data.scale, data.acceleration, data.storageIndex, false));
			break;
		case 4:
			global.network_fight_object_storage.push(data.storageIndex, create_poking_bone(data.x, data.y, data.object, data.speed, data.size, data.direction, data.storageIndex, false));
			break;
		case 5:
			global.network_fight_object_storage.push(data.storageIndex, create_spinning_bone(data.x, data.y, data.object, data.speed, data.size, data.direction, data.angle, data.angleSpeed, data.storageIndex, false));
			break;
		case 6:
			global.network_fight_object_storage.push(data.storageIndex, create_solo_moving_platform(data.x, data.y, data.scale, data.speed, data.leftStation, data.rightStation, data.storageIndex, false));
			break;
		case 7:
			global.network_fight_object_storage.push(data.storageIndex, create_moving_platforms(data.x, data.y, data.count, data.scale, data.distance, data.speed, data.storageIndex, false));
			break;
		case 8:
			global.network_fight_object_storage.push(data.storageIndex, create_next_moving_platform(data.x, data.y, data.count, data.scale, data.distance, data.speed, data.storageIndex, false));
			break;
		case 9:
			global.network_fight_object_storage.push(data.storageIndex, create_gasterblaster(data.object, data.x, data.y, data.targetX, data.targetY, data.angle, data.flyTime, data.chargeTime, data.flyoutTime, data.destroyTime, data.storageIndex, false));
			break;
		case 10:
			global.network_fight_object_storage.push(data.storageIndex, create_solo_gasterblaster(data.x, data.y, data.object, data.targetTime, data.chargeTime, data.destroyTime, data.storageIndex, false));
			break;
		case 11:
			global.network_fight_object_storage.push(data.storageIndex, create_error_string(data.x, data.y, data.object, data.targetX, data.targetY, data.scaleSpeed, data.storageIndex, false));
			break;
		case 12:
			global.network_fight_object_storage.push(data.storageIndex, create_knife_swing(data.x, data.y, data.object, data.angle, data.distance, data.storageIndex, false));
			break;
		case 13:
			global.network_fight_object_storage.push(data.storageIndex, create_big_knife_x(data.x, data.y, data.object, data.direction, data.angle, data.pointStopX, data.storageIndex, false));
			break;
		case 14:
			global.network_fight_object_storage.push(data.storageIndex, create_big_knife_y(data.x, data.y, data.object, data.direction, data.angle, data.pointStopY, data.storageIndex, false));
			break;
		case 15:
			global.network_fight_object_storage.push(data.storageIndex, create_damage_wave(data.x, data.y, data.object, data.angle, data.speed, data.storageIndex, false));
			break;
		case 16:
			global.network_fight_object_storage.push(data.storageIndex, create_spike(data.x, data.y, data.object, data.speed, data.direction, data.storageIndex, false));
			break;
		default:
			global.network_fight_object_storage.push(data.storageIndex, create_battle_object(data.x, data.y, data.depth, data.object, data.varStruct, data.storageIndex, false));
			break;
	}
});

packet_handler_register("battleReplaceObject", function(data) {
	switch (data.objectType) {
		case 2:
			global.network_fight_object_storage.replace(data.storageIndex, create_bone(data.x, data.y, data.object, data.speed, data.size, data.direction, data.angle, data.storageIndex, false), data.number);
			break;
	}
});

packet_handler_register("battleChangeObjectData", function(data) {
	switch (data.objectType) {
		case 2:
			if (data.eventName == 0) move_bone(global.network_fight_object_storage.instances[data.storageIndex][? data.number], data.number, data.speed, data.direction, data.storageIndex, false);
			if (data.eventName == 1) scale_bone(global.network_fight_object_storage.instances[data.storageIndex][? data.number], data.number, data.scale, data.scaleStep, data.storageIndex, false);
			if (data.eventName == 2) shake_bone(global.network_fight_object_storage.instances[data.storageIndex][? data.number], data.number, data.storageIndex, false);
		break;
		case 5:
			if (data.eventName == 0) change_angle_speed_spinning_bone(global.network_fight_object_storage.instances[data.storageIndex][? data.number], data.number, data.angleSpeed, data.isSmooth, data.storageIndex, false);
		break;
		case 10:
			if (data.eventName == 0) change_solo_gasterblaster_position(global.network_fight_object_storage.instances[data.storageIndex][? data.number], data.number, data.newX, data.newY, data.storageIndex, false);
			if (data.eventName == 1) change_solo_gasterblaster_target(global.network_fight_object_storage.instances[data.storageIndex][? data.number], data.number, data.target, data.storageIndex, false);
		break;
		case 13:
			if (data.eventName == 0) set_big_knife_move(global.network_fight_object_storage.instances[data.storageIndex][? data.number], data.number, data.distance, data.storageIndex, false);
			if (data.eventName == 1) set_big_knife_move_up(global.network_fight_object_storage.instances[data.storageIndex][? data.number], data.number, data.storageIndex, false);
			if (data.eventName == 2) set_big_knife_spin(global.network_fight_object_storage.instances[data.storageIndex][? data.number], data.number, data.rotatingSpeed, data.storageIndex, false);
		break;
	}
});

packet_handler_register("battleDestroyObject", function(data) {
	global.network_fight_object_storage.clear(data.storageIndex);
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
	
	instance_destroy(global.network_fight_object_storage);
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
