function ink_sans_attack0(pow, player) {
	instance_create(attack_creator_ink_sans, {
		character_instance: player,
		_power: pow,
		_id: 0,
		attack_num: irandom_range(0, 1)
	});
}

function ink_sans_attack1(pow, player) {
	instance_create(attack_creator_ink_sans, {
		character_instance: player,
		_power: pow,
		_id: 1,
		attack_num: irandom_range(0, 1)
	});
}

function ink_sans_attack2(pow, player) {
	instance_create(attack_creator_ink_sans, {
		character_instance: player,
		_power: pow,
		_id: 2,
		attack_num: irandom_range(0, 1)
	});
}

function ink_sans_special_attack(player) {
	instance_create(attack_creator_ink_sans, {
		character_instance: player,
		_id: 3
	});
}