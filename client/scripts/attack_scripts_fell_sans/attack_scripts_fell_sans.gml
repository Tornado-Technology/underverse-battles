/// @param {Real} _power
/// @param {Id.Instance} player
function fell_sans_attack0(_power, player) {
	instance_create(obj_attack_fell_sans_0, {
		character_instance: player,
		_power: _power,
	});
}

/// @param {Real} _power
/// @param {Id.Instance} player
function fell_sans_attack1(_power, player) {
	instance_create(obj_attack_fell_sans_1, {
		character_instance: player,
		_power: _power
	});
}

/// @param {Real} _power
/// @param {Id.Instance} player
function fell_sans_attack2(_power, player) {
	instance_create(obj_attack_fell_sans_2, {
		character_instance: player,
		_power: _power,
		use_gravity_attack: player.use_gravity_attack
	});
}

/// @param {Id.Instance} player
function char_fell_sans_special_attack(player) {
	instance_create(obj_attack_fell_sans_special, {
		character_instance: player,
		use_gravity_attack: player.use_gravity_attack
	});
}