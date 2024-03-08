function call_attack_papyrus_0 (player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_papyrus_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
};

function call_attack_papyrus_1(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_papyrus_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
};