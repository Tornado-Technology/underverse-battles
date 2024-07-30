/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function error_sans_attack0(player, _power, type = fight_random_integer(0, 4)) {
	instance_create(obj_attack_error_sans_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function error_sans_attack1(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_error_sans_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function error_sans_attack2(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_error_sans_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
function error_sans_special_attack(player) {
	instance_create(obj_attack_error_sans_special, {
		character_instance: player
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function error_sans_anti_piracy_attack0(player, _power, type = fight_random_integer(0, 4)) {
	instance_create(obj_attack_error_sans_anti_piracy_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function error_sans_anti_piracy_attack1(player, _power, type = fight_random_integer(0, 1)) {
	instance_create(obj_attack_error_sans_anti_piracy_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function error_sans_anti_piracy_attack2(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_error_sans_anti_piracy_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
function error_sans_anti_piracy_special_attack(player) {
	instance_create(obj_attack_error_sans_anti_piracy_special, {
		character_instance: player
	});
}