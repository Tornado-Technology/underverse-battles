function call_attack_dream_0(pow, player) {
	instance_create(obj_attack_dream_0, {
		character_instance: player,
		_power: pow
	});
}

function call_attack_dream_1(pow, player) {
	instance_create(obj_attack_dream_1, {
		character_instance: player,
		_power: pow
	});
}

function call_attack_dream_2(pow, player) {
	instance_create(obj_attack_dream_2, {
		character_instance: player,
		_power: pow
	});
}

function call_attack_dream_special(player) {
	instance_create(obj_attack_dream_special, {
		character_instance: player
	});
}