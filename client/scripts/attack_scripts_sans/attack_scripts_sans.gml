/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function char_sans_attack_0(player, _power, type = irandom(5)) {
	instance_create(obj_attack_sans_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function char_sans_attack_1(player, _power, type = irandom(2)) {
	instance_create(obj_attack_sans_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function char_sans_attack_2(player, _power, type = irandom(1)) {
	instance_create(obj_attack_sans_2, {
		character_instance: player,
		_power: _power,
		type: type,
		use_gravity_attack: player.use_gravity_attack
	});
}

/// @param {Id.Instance} player
function char_sans_special_attack(player) {
	instance_create(obj_attack_sans_special, {
		character_instance: player,
		use_gravity_attack: player.use_gravity_attack
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function char_saness_attack_1(player, _power, type = irandom(2)) {
	instance_create(obj_attack_saness_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
function char_saness_special_attack(player) {
	instance_create(obj_attack_saness_special, {
		character_instance: player,
		use_gravity_attack: player.use_gravity_attack
	});
}