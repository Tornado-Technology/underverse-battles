function call_attack_papyrus_0 (player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_papyrus_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
};

function call_attack_papyrus_1(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_papyrus_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
};

function call_attack_papyrus_2(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_papyrus_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
};

function char_papyrus_special_attack(player) {
	instance_create(obj_attack_papyrus_special, {
		character_instance: player,
		use_gravity_attack: player.use_gravity_attack
	});
}