/// @param {Real} _power
/// @param {Id.Instance} player
function char_sans_attack_0(_power, player) {
	instance_create(obj_attack_sans_0, {
		character_instance: player,
		_power: _power
	});
}

/// @param {Real} _power
/// @param {Id.Instance} player
function char_sans_attack_1(_power, player) {
	instance_create(obj_attack_sans_1, {
		character_instance: player,
		_power: _power
	});
}

/// @param {Real} _power
/// @param {Id.Instance} player
function char_sans_attack_2(_power, player) {
	instance_create(obj_attack_sans_2, {
		character_instance: player,
		_power: _power,
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

/// @param {Real} _power
/// @param {Id.Instance} player
function char_saness_attack_1(_power, player) {
	instance_create(obj_attack_saness_1, {
		character_instance: player,
		_power: _power
	});
}

/// @param {Id.Instance} player
function char_saness_special_attack(player) {
	instance_create(obj_attack_saness_special, {
		character_instance: player,
		use_gravity_attack: player.use_gravity_attack
	});
}