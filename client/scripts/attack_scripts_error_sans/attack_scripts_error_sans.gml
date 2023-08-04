function error_sans_attack0(pow, player) {
	instance_create(obj_attack_error_sans_0, {
		character_instance: player,
		_power: pow
	});
}

function error_sans_attack1(pow, player) {
	instance_create(obj_attack_error_sans_1, {
		character_instance: player,
		_power: pow
	});
}

function error_sans_attack2(pow, player) {
	instance_create(obj_attack_error_sans_2, {
		character_instance: player,
		_power: pow
	});
}

function error_sans_special_attack(player) {
	instance_create(obj_attack_error_sans_special, {
		character_instance: player,
		_id: 3
	});
}