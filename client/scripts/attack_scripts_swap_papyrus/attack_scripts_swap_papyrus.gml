function swap_papyrus_attack0(_power, _enemy) {
	var attack = instance_create(attack_creator_swap_papyrus);
	attack.character_instance = _enemy;
	attack._power = _power;
	attack._id = 0;
	attack.attack_num = irandom_range(0, 3);
}

function swap_papyrus_attack1(_power, _enemy) {
	var attack = instance_create(attack_creator_swap_papyrus);
	attack.character_instance = _enemy;
	attack._power = _power;
	attack._id = 1;
	attack.attack_num = irandom_range(0, 2);
}

function swap_papyrus_attack2(_power, _enemy) {
	var attack = instance_create(attack_creator_swap_papyrus);
	attack.character_instance = _enemy;
	attack._power = _power;
	attack._id = 2;
	attack.attack_num = _enemy.use_gravity_attack ? 0 : 1;
}