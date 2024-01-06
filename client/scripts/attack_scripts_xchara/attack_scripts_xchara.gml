function xchara_attack0(pow, player) {
	instance_create(obj_attack_xchara_0, {
		character_instance: player,
		_power: pow
	});
}

function xchara_attack1(pow, player) {
	instance_create(obj_attack_xchara_1, {
		character_instance: player,
		_power: pow
	});
}

function xchara_attack2(pow, player) {
	instance_create(obj_attack_xchara_2, {
		character_instance: player,
		_power: pow
	});
}

function xchara_special_attack(player) {
	instance_create(obj_attack_xchara_special, {
		character_instance: player
	});
}