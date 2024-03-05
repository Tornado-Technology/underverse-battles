function fight_random_choose() {
	var part = global.max_seed / argument_count;
	var position = part;
	var i = 0;
	var random_number = argument_count - 1;
	
	repeat(argument_count - 1) {
		if (global.seed < position) {
			random_number = i;
			break;
		}
		i++;
		position += part;
	}
	
	fight_random_park_miller();
	
	return argument[random_number];
}