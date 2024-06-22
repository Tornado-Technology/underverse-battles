function jevil_attack0(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_jevil_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function jevil_attack1(player, _power, type = fight_random_integer(0, 1)) {
	instance_create(obj_attack_jevil_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function jevil_attack2(player, _power, type = fight_random_integer(0, 0)) {
	instance_create(obj_attack_jevil_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}