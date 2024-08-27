function call_attack_nightmare_0 (player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_nightmare_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function call_attack_nightmare_1(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_nightmare_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});	
}

function call_attack_nightmare_2(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_nightmare_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});	
}

function call_attack_nightmare_special(player) {
	instance_create(obj_attack_nightmare_special, {
		character_instance: player
	});
}


function call_attack_nightmare_ice_cream_0(player, _power, type = fight_random_integer(0, 5)) {
	instance_create(obj_attack_ice_cream_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function call_attack_nightmare_ice_cream_1(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_ice_cream_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});	
}

function call_attack_nightmare_ice_cream_2(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_ice_cream_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});	
}


function call_attack_nightmare_mecha_0 (player, _power, type = fight_random_integer(0, 5)) {
	instance_create(obj_attack_mecha_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function call_attack_nightmare_mecha_1(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_mecha_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});	
}

function call_attack_nightmare_mecha_2(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_mecha_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});	
}
