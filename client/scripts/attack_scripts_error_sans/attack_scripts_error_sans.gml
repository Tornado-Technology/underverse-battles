function error_sans_attack0(_power, _enemy) {
	var attack = instance_create(attack_creator_error_sans);
	attack.character_instance = _enemy;
	attack._power = _power;
	attack._id = 0;
	attack.attack_num = irandom_range(0, 3);
}

function error_sans_attack1(_power, _enemy) {
	var attack = instance_create(attack_creator_error_sans);
	attack.character_instance = _enemy;
	attack._power = _power;
	attack._id = 1;
}

function error_sans_attack2(_power, _enemy) {
	var attack = instance_create(attack_creator_error_sans);
	attack.character_instance = _enemy;
	attack._power = _power;
	attack._id = 2;
	attack.attack_num = irandom_range(0, 2);
}