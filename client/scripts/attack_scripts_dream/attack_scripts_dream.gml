function call_attack_dream_0(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_dream_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function call_attack_dream_1(player, _power, type = fight_random_integer(0, 4)) {
	instance_create(obj_attack_dream_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function call_attack_dream_2(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_dream_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function call_attack_dream_special(player) {
	instance_create(obj_attack_dream_special, {
		character_instance: player
	});
}