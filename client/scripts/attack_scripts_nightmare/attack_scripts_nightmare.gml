function call_attack_nightmare_0 (player, _power, type = fight_random_integer(0, 5)) {
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