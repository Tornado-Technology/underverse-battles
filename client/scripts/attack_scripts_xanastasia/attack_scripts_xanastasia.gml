function call_attack_xanastasia_0(player, _power, type = fight_random_integer(0, 4)) {
	instance_create(obj_attack_xanastasia_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function call_attack_xanastasia_1(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_xanastasia_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function call_attack_xanastasia_2(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_xanastasia_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function call_attack_xanastasia_special(player) {
	instance_create(obj_attack_xanastasia_special, {
		character_instance: player
	});
}