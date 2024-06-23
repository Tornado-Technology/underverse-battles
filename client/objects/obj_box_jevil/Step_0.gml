x = approach(x, target.x, step * dtime);
y = approach(y, target.y, step * dtime);


if (x == target.x && y == target.y) {
	bomb();
	instance_destroy();
	
};