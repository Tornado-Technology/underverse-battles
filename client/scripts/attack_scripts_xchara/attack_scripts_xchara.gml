function xchara_attack0(pow, player) {
	instance_create(attack_creator_xchara, {
		character_instance: player,
		_power: pow,
		_id: 0,
		attack_num: irandom_range(0, 3)
	});
}

function xchara_attack1(pow, player) {
	instance_create(attack_creator_xchara, {
		character_instance: player,
		_power: pow,
		_id: 1,
		attack_num: irandom_range(0, 2)

	});
}

function xchara_attack2(pow, player) {
	instance_create(attack_creator_xchara, {
		character_instance: player,
		_power: pow,
		_id: 2,
		attack_num: irandom_range(0, 1)
	});
}

function xchara_special_attack(player) {
	instance_create(attack_creator_xchara, {
		character_instance: player,
		_id: 3
	});
}