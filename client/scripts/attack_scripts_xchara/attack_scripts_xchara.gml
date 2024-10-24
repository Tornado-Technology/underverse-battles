function xchara_attack0(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_xchara_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function xchara_attack1(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_xchara_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function xchara_attack2(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_xchara_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function xchara_special_attack(player) {
	instance_create(obj_attack_xchara_special, {
		character_instance: player
	});
}