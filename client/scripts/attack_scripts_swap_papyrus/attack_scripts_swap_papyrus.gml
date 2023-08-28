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

function swap_papyrus_attack2(pow, player) {
	instance_create(attack_creator_swap_papyrus, {
		character_instance: player,
		_power: pow,
		_id: 2,
		attack_num: player.use_gravity_attack ? 0 : 1
	});
}

function swap_papyrus_special_attack(player) {
	instance_create(attack_creator_swap_papyrus, {
		character_instance: player,
		_id: 3,
		attack_num: player.use_gravity_attack ? 0 : 1
	});
}