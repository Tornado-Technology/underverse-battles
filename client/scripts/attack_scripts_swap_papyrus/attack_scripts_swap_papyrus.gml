function swap_papyrus_attack0(pow, player) {
	instance_create(attack_creator_swap_papyrus, {
		character_instance: player,
		_power: pow,
		_id: 0,
		attack_num: irandom_range(0, 3)
	});
}

function swap_papyrus_attack1(pow, player) {
	instance_create(attack_creator_swap_papyrus, {
		character_instance: player,
		_power: pow,
		_id: 1,
		attack_num: irandom_range(0, 2)
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