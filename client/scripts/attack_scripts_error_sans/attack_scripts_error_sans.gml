function error_sans_attack0(pow, player) {
	instance_create(attack_creator_error_sans, {
		character_instance: player,
		_power: pow,
		_id: 0,
		attack_num: irandom_range(0, 3)
	});
}

function error_sans_attack1(pow, player) {
	instance_create(attack_creator_error_sans, {
		character_instance: player,
		_power: pow,
		_id: 1
	});
}

function error_sans_attack2(pow, player) {
	instance_create(attack_creator_error_sans, {
		character_instance: player,
		_power: pow,
		_id: 2,
		attack_num: irandom_range(0, 2)
	});
}

function error_sans_special_attack(player) {
	instance_create(attack_creator_error_sans, {
		character_instance: player,
		_id: 3
	});
}