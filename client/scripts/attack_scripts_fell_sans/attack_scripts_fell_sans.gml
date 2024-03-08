/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function fell_sans_attack0(player, _power, type = fight_random_integer(0, 5)) {
	instance_create(obj_attack_fell_sans_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function fell_sans_attack1(player, _power, type = fight_random_integer(0, 2)) {
	instance_create(obj_attack_fell_sans_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function fell_sans_attack2(player, _power, type = fight_random_integer(0, 1)) {
	instance_create(obj_attack_fell_sans_2, {
		character_instance: player,
		_power: _power,
		type: type,
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