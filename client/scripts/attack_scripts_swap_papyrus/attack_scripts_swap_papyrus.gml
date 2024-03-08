function swap_papyrus_attack0(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_swap_papyrus_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function swap_papyrus_attack1(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_swap_papyrus_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function swap_papyrus_attack2(player, _power, type = fight_random_integer(0, 1)) {
	instance_create(obj_attack_swap_papyrus_2, {
		character_instance: player,
		_power: _power,
		type: type,
		use_gravity_attack: player.use_gravity_attack
	});
}

function swap_papyrus_special_attack(player) {
	instance_create(obj_attack_swap_papyrus_special, {
		character_instance: player,
		use_gravity_attack: player.use_gravity_attack
	});
}