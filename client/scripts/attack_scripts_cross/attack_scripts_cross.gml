function cross_attack0(pow, player) {
	instance_create(attack_creator_cross, {
		character_instance: player,
		_power: pow,
		_id: 0,
		attack_num: irandom_range(0, 3)
	});
}

function cross_attack1(pow, player) {
	instance_create(attack_creator_cross, {
		character_instance: player,
		_power: pow,
		_id: 1,
		attack_num: irandom_range(0, 2)
	});
}

function cross_attack2(pow, player) {
	instance_create(attack_creator_cross, {
		character_instance: player,
		_power: pow,
		_id: 2,
		attack_num: player.use_gravity_attack ? 0 : 1
	});
}

function cross_special_attack(player) {
	instance_create(attack_creator_cross, {
		character_instance: player,
		_id: 3
	});
}

function cross_xevent_attack0(pow, player) {
	instance_create(attack_creator_cross_xevent, {
		character_instance: player,
		_power: pow,
		_id: 0,
		attack_num: irandom_range(0, 3)
	});
}

function cross_xevent_attack1(pow, player) {
	instance_create(attack_creator_cross_xevent, {
		character_instance: player,
		_power: pow,
		_id: 1,
		attack_num: irandom_range(0, 2)
	});
}

function cross_xevent_attack2(pow, player) {
	instance_create(attack_creator_cross_xevent, {
		character_instance: player,
		_power: pow,
		_id: 2,
		attack_num: irandom_range(0, 2)
	});
}

function cross_xevent_special_attack(player) {
	instance_create(attack_creator_cross_xevent, {
		character_instance: player,
		_id: 3
	});
}