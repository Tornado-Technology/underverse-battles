/// @param power
function jevil_attack0(_power, player) {
	instance_create(obj_attack_jevil_0,{
	character_instance: player,
	_power: _power
	})
}

/// @param power
function jevil_attack1(_power) {
	instance_create(obj_attack_jevil_1);
	attack._power = _power;
	attack._id = 1;
}

/// @param power
function jevil_attack2(_power) {
	instance_create(obj_attack_jevil_2);
	attack._power = _power;
	attack._id = 2;
}