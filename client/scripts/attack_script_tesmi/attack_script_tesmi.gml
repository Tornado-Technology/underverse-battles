/// @param {Real} _power
function tesmi_attack_0(_power, _enemy) {
	show_debug_message(12)
	var attack = instance_create(obj_attack_tesmi_1, {
		_power: _power,
		character: _enemy,
		num: 1,
	});
	
}

/// @param {Real} _power
function tesmi_attack_1(_power, _enemy) {
	var attack = instance_create(obj_attack_tesmi_1, {
		_power: _power,
		character: _enemy,
		num: 2,
	});
}

/// @param {Real} _power
function tesmi_attack_2(_power, _enemy) {
	var attack = instance_create(obj_attack_tesmi_1, {
		_power: _power,
		character: _enemy,
		num: 3,
	});
}
