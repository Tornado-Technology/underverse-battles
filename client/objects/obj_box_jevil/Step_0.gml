x = approach(x, target.x, step * dtime);
y = approach(y, target.y, step * dtime);


if (x == target.x && y == target.y) {
	if (!is_bonb) {
		bomb();
	};
	
	alpha = approach(alpha, 0, alpha_time);
	radius++;
	is_bonb = true;
	if (alpha == 0) {
		instance_destroy();
	}	
};