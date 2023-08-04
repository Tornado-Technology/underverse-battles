function fell_sans_attack0(pow, player) {
	instance_create(obj_attack_fell_sans_0, {
		character_instance: player,
		_power: pow,
	});
}

function fell_sans_attack1(pow, player) {
	instance_create(obj_attack_fell_sans_1, {
		character_instance: player,
		_power: pow
	});
}

function fell_sans_attack2(pow, player) {
	instance_create(obj_attack_fell_sans_2, {
		character_instance: player,
		_power: pow,
		use_gravity_attack: player.use_gravity_attack
	});
}

function char_fell_sans_special_attack(player) {
	instance_create(obj_attack_fell_sans_special, {
		character_instance: player,
		use_gravity_attack: player.use_gravity_attack
	});
}