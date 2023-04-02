function fell_sans_attack0(pow, player) {
	instance_create(attack_creator_fell_sans, {
		character_instance: player,
		_power: pow,
		_id: 0,
		attack_num: irandom_range(0, 3)
	});
}

function fell_sans_attack1(pow, player) {
	instance_create(attack_creator_fell_sans, {
		character_instance: player,
		_power: pow,
		_id: 1,
		attack_num: irandom_range(0, 2)
	});
}

function fell_sans_attack2(pow, player) {
	instance_create(attack_creator_fell_sans, {
		character_instance: player,
		_power: pow,
		_id: 2,
		attack_num: player.use_gravity_attack ? 0 : 1
	});
}

function char_fell_sans_special_attack(player) {
	instance_create(attack_creator_fell_sans, {
		character_instance: player,
		_id: 3,
		attack_num: player.use_gravity_attack ? 0 : 1
	});
}