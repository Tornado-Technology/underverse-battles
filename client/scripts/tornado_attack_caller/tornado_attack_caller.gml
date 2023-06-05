function dan_attack_0(pow, player) {
	instance_create(obj_tornado_attack_creator, {
		character_instance: player,
		_power: pow,
		_id: 0,
		attack_num: irandom_range(0, 2)
	});
}

function dan_attack_1(pow, player) {
	instance_create(obj_tornado_attack_creator, {
		character_instance: player,
		_power: pow,
		_id: 1
	});
}

function dan_attack_2(pow, player) {
	instance_create(obj_tornado_attack_creator, {
		character_instance: player,
		_power: pow,
		_id: 2
	});
}

function dan_special_attack(player) {
	instance_create(obj_tornado_attack_creator, {
		character_instance: player,
		_id: 3
	});
}