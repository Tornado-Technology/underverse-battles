function jevil_attack0(player, _power, type = fight_random_integer(0, 2)) {
	player.play_snd_being_attack();
	instance_create(obj_attack_jevil_0, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function jevil_attack1(player, _power, type = fight_random_integer(0, 3)) {
	player.play_snd_being_attack();
	instance_create(obj_attack_jevil_1, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function jevil_attack2(player, _power, type = fight_random_integer(0, 2)) {
	player.play_snd_being_attack();
	instance_create(obj_attack_jevil_2, {
		character_instance: player,
		_power: _power,
		type: type,
	});
}

function jevil_special_attack(player) {
	instance_create(obj_attack_jevil_special, {
		character_instance: player
	});
}