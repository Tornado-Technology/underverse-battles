function green_attack0(pow, player) {
	instance_create(attack_creator_green, {
		character_instance: player,
		_power: pow,
		//_id: 0,
		//attack_num: irandom_range(0, 3)
		_id: 0,
		attack_num: 2
	});
}

function green_attack1(pow, player) {
	instance_create(attack_creator_green, {
		character_instance: player,
		_power: pow,
		//_id: 1
		_id: 0,
		attack_num: 2
	});
}

function green_attack2(pow, player) {
	instance_create(attack_creator_green, {
		character_instance: player,
		_power: pow,
		//_id: 2,
		//attack_num: irandom_range(0, 1)
		_id: 0,
		attack_num: 2
	});
}

function green_special_attack(player) {
	instance_create(attack_creator_green, {
		character_instance: player,
		_id: 3
	});
}