function green_attack0(pow, player) {
	instance_create(obj_attack_green_0, {
		character_instance: player,
		_power: pow
	});
}

function green_attack1(pow, player) {
	instance_create(obj_attack_green_1, {
		character_instance: player,
		_power: pow
	});
}

function green_attack2(pow, player) {
	instance_create(obj_attack_green_2, {
		character_instance: player,
		_power: pow
	});
}

function green_special_attack(player) {
	instance_create(obj_attack_green_special, {
		character_instance: player
	});
}