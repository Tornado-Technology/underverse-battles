function fight_random_float(x1, x2) {
	var n = abs(x2 - x1) * 100;
	var part = global.max_seed / (n + 1);
	var position = part;
	var i = 0;
	var random_number = x2;
	
	repeat(n) {
		if (global.seed < position) {
			random_number = i + x1;
			break;
		}
		i += 0.01;
		position += part;
	}
	
	fight_random_park_miller();
	
	return random_number;
}