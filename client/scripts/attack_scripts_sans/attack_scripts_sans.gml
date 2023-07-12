function char_sans_attack_0(pow, player) {
	instance_create(obj_attack_sans_0, {
		character_instance: player,
		_power: pow
	});
}

function char_sans_attack_1(pow, player) {
	instance_create(obj_attack_sans_1, {
		character_instance: player,
		_power: pow
	});
}

function char_sans_attack_2(pow, player) {
	instance_create(obj_attack_sans_2, {
		character_instance: player,
		_power: pow,
		use_gravity_attack: player.use_gravity_attack
	});
}

function char_sans_special_attack(player) {
	instance_create(obj_attack_sans_special, {
		character_instance: player,
		use_gravity_attack: player.use_gravity_attack
	});
}