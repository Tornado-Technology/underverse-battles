function fight_random_integer(x1, x2) {
	var n = abs(x2 - x1);
	var part = global.max_seed / (n + 1);
	var position = part;
	var i = 0;
	var random_number = x2;
	
	repeat(n) {
		if (global.seed < position) {
			random_number = i + x1;
			break;
		}
		i++;
		position += part;
	}
	
	fight_random_park_miller();
	
	return random_number;
}