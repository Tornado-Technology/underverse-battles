function ink_sans_attack0(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_ink_sans_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function ink_sans_attack1(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_ink_sans_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function ink_sans_attack2(player, _power, type = fight_random_integer(0, 1)) {
	instance_create(obj_attack_ink_sans_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function ink_sans_special_attack(player) {
	instance_create(obj_attack_ink_sans_special, {
		character_instance: player
	});
}

function ink_sans_ice_blood_attack1(player, _power, type = fight_random_integer(0, 1)) {
	instance_create(obj_attack_ink_sans_ice_blood_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function ink_sans_ice_blood_attack2(player, _power, type = fight_random_integer(0, 1)) {
	instance_create(obj_attack_ink_sans_ice_blood_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function ink_sans_ice_blood_special_attack(player) {
	instance_create(obj_attack_ink_sans_ice_blood_special, {
		character_instance: player
	});
}