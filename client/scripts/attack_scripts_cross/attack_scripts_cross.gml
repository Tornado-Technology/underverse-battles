/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function cross_attack0(player, _power, type = irandom(3)) {
	instance_create(obj_attack_cross_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function cross_attack1(player, _power, type = irandom(2)) {
	instance_create(obj_attack_cross_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function cross_attack2(player, _power, type = irandom(1)) {
	instance_create(obj_attack_cross_2, {
		character_instance: player,
		_power: _power,
		type: type,
		use_gravity_attack: player.use_gravity_attack
	});
}

/// @param {Id.Instance} player
function cross_special_attack(player) {
	instance_create(obj_attack_cross_special, {
		character_instance: player
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function cross_xevent_attack0(player, _power, type = irandom(3)) {
	instance_create(obj_attack_cross_xevent_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function cross_xevent_attack1(player, _power, type = irandom(2)) {
	instance_create(obj_attack_cross_xevent_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
/// @param {Real} _power
/// @param {Real} type
function cross_xevent_attack2(player, _power, type = irandom(2)) {
	instance_create(obj_attack_cross_xevent_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

/// @param {Id.Instance} player
function cross_xevent_special_attack(player) {
	instance_create(obj_attack_cross_xevent_special, {
		character_instance: player
	});
}