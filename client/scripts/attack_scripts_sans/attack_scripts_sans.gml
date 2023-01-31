function char_sans_attack_0(_power, _enemy) {
	var attack = instance_create(attack_creator_sans);
	attack.character_instance = _enemy;
	attack._power = _power;
	attack._id = 0;
	attack.attack_num = irandom_range(0, 4);
}

function char_sans_attack_1(_power, _enemy) {
	var attack = instance_create(attack_creator_sans);
	attack.character_instance = _enemy;
	attack._power = _power;
	attack._id = 1;
	attack.attack_num = irandom_range(0, 2);
}

function char_sans_attack_2(_power, _enemy) {
	var attack = instance_create(attack_creator_sans);
	attack.character_instance = _enemy;
	attack._power = _power;
	attack._id = 2;
	attack.attack_num = _enemy.use_gravity_attack ? 0 : 1;
}

function char_sansa_claus_attack_2(_power, _enemy) {
	var attack = instance_create(attack_creator_sansa_claus);
	attack.character_instance = _enemy;
	attack._power = _power;
	attack._id = 2;
	attack.attack_num = _enemy.use_gravity_attack ? 0 : 1;
}