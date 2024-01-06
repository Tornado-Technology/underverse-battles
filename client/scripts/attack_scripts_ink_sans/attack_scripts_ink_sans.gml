function ink_sans_attack0(pow, player) {
	instance_create(obj_attack_ink_sans_0, {
		character_instance: player,
		_power: pow
	});
}

function ink_sans_attack1(pow, player) {
	instance_create(obj_attack_ink_sans_1, {
		character_instance: player,
		_power: pow
	});
}

function ink_sans_attack2(pow, player) {
	instance_create(obj_attack_ink_sans_2, {
		character_instance: player,
		_power: pow
	});
}

function ink_sans_special_attack(player) {
	instance_create(obj_attack_ink_sans_special, {
		character_instance: player
	});
}