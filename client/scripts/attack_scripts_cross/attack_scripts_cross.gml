function cross_attack0(pow, player) {
	instance_create(obj_attack_cross_0, {
		character_instance: player,
		_power: pow
	});
}

function cross_attack1(pow, player) {
	instance_create(obj_attack_cross_1, {
		character_instance: player,
		_power: pow
	});
}

function cross_attack2(pow, player) {
	instance_create(obj_attack_cross_2, {
		character_instance: player,
		_power: pow,
		use_gravity_attack: player.use_gravity_attack
	});
}

function cross_special_attack(player) {
	instance_create(obj_attack_cross_special, {
		character_instance: player
	});
}

function cross_xevent_attack0(pow, player) {
	instance_create(obj_attack_cross_xevent_0, {
		character_instance: player,
		_power: pow
	});
}

function cross_xevent_attack1(pow, player) {
	instance_create(obj_attack_cross_xevent_1, {
		character_instance: player,
		_power: pow
	});
}

function cross_xevent_attack2(pow, player) {
	instance_create(obj_attack_cross_xevent_2, {
		character_instance: player,
		_power: pow
	});
}

function cross_xevent_special_attack(player) {
	instance_create(obj_attack_cross_xevent_special, {
		character_instance: player
	});
}