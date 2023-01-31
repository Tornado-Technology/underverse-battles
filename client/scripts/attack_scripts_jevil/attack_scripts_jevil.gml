/// @param power
function jevil_attack0(_power) {
	var attack = instance_create_depth(0, 0, 0, attack_creator_jevil);
	attack._power = _power;
	attack._id = 0;
}

/// @param power
function jevil_attack1(_power) {
	var attack = instance_create_depth(0, 0, 0, attack_creator_jevil);
	attack._power = _power;
	attack._id = 1;
}

/// @param power
function jevil_attack2(_power) {
	var attack = instance_create_depth(0, 0, 0, attack_creator_jevil);
	attack._power = _power;
	attack._id = 2;
}