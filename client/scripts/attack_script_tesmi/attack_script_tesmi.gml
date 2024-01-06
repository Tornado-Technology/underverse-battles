/// @param {Real} _power
/// @param {Id.Instance} player
function tesmi_attack_0(_power, player) {
	show_debug_message(12)
	var attack = instance_create(obj_attack_tesmi_0, {
		character_instance: player,
		_power: _power
	});
	
}

/// @param {Real} _power
/// @param {Id.Instance} player
function tesmi_attack_1(_power, player) {
	var attack = instance_create(obj_attack_tesmi_0, {
		character_instance: player,
		_power: _power
	});
}

/// @param {Real} _power
/// @param {Id.Instance} player
function tesmi_attack_2(_power, player) {
	var attack = instance_create(obj_attack_tesmi_0, {
		character_instance: player,
		_power: _power
	});
}
