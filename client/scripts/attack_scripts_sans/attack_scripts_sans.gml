function char_sans_attack_0(pow, player) {
	instance_create(attack_creator_sans, {
		character_instance: player,
		_power: pow,
		_id: 0,
		attack_num: irandom_range(0, 4)
	});
}

function char_sans_attack_1(pow, player) {
	instance_create(attack_creator_sans, {
		character_instance: player,
		_power: pow,
		_id: 1,
		attack_num: irandom_range(0, 2)
	});
}

function char_sans_attack_2(pow, player) {
	instance_create(attack_creator_sans, {
		character_instance: player,
		_power: pow,
		_id: 2,
		attack_num: player.use_gravity_attack ? 0 : 1
	});
}

function char_sans_special_attack(player) {
	instance_create(attack_creator_sans, {
		character_instance: player,
		_id: 3,
		attack_num: player.use_gravity_attack ? 0 : 1
	});
}