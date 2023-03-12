function cross_attack0(_power, _player) {
	var attack = instance_create(attack_creator_cross);
	attack.character_instance = _player;
	attack._power = _power;
	attack._id = 0;
	attack.attack_num = irandom_range(0, 3);
}

function cross_attack1(_power, _player) {
	var attack = instance_create(attack_creator_cross);
	attack.character_instance = _player;
	attack._power = _power;
	attack._id = 1;
	attack.attack_num = irandom_range(0, 2);
}

function cross_attack2(_power, _player) {
	var attack = instance_create(attack_creator_cross);
	attack.character_instance = _player;
	attack._power = _power;
	attack._id = 2;
	attack.attack_num = _player.use_gravity_attack ? 0 : 1;
}

function cross_special_attack(_player) {
	var attack = instance_create(attack_creator_cross);
	attack.character_instance = _player;
	attack._id = 3;
}

function cross_xevent_attack1(_power, _player) {
	var attack = instance_create(attack_creator_cross_xevent);
	attack.character_instance = _player;
	attack._power = _power;
	attack._id = 1;
	attack.attack_num = irandom_range(0, 2);
}

function cross_xevent_attack2(_power, _player) {
	var attack = instance_create(attack_creator_cross_xevent);
	attack.character_instance = _player;
	attack._power = _power;
	attack._id = 2;
	attack.attack_num = irandom_range(0, 2);
}

function cross_xevent_special_attack(_player) {
	var attack = instance_create(attack_creator_cross_xevent);
	attack.character_instance = _player;
	attack._id = 3;
}