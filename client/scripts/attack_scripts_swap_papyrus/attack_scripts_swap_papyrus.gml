function swap_papyrus_attack0(pow, player) {
	instance_create(obj_attack_swap_papyrus_0, {
		character_instance: player,
		_power: pow
	});
}

function swap_papyrus_attack1(pow, player) {
	instance_create(obj_attack_swap_papyrus_1, {
		character_instance: player,
		_power: pow
	});
}

function swap_papyrus_attack2(_power, player) {
	instance_create(obj_attack_swap_papyrus_2, {
		character_instance: player,
		_power: _power,
		use_gravity_attack: player.use_gravity_attack
	});
}

function swap_papyrus_special_attack(player) {
	instance_create(obj_attack_swap_papyrus_special, {
		character_instance: player,
		attack_num: player.use_gravity_attack ? 0 : 1
	});
}