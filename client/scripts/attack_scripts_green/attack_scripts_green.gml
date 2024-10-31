/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function green_attack0(player, _power, type = fight_random_integer(0, 3)) {
	instance_create(obj_attack_green_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function green_attack1(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_green_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function green_attack2(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_green_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
function green_special_attack(player) {
	instance_create(obj_attack_green_special, {
		character_instance: player
	});
}

function green_dj_attack1(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_green_dj_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function green_dj_attack2(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_green_dj_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function green_dj_special_attack(player) {
	instance_create(obj_attack_green_dj_special, {
		character_instance: player
	});
}