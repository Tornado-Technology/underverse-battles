function swap_sans_attack0(player, _power, type = irandom(3)) {
	instance_create(obj_attack_swap_sans_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function swap_sans_attack1(player, _power, type = irandom(2)) {
	instance_create(obj_attack_swap_sans_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function swap_sans_attack2(player, _power, type = irandom(2)) {
	instance_create(obj_attack_swap_sans_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function swap_sans_special_attack(player) {
	instance_create(obj_attack_swap_sans_special, {
		character_instance: player
	});
}