function rand_side_from(x0, y0, x1, y1){
	var position = [];
	
	var pos = fight_random_integer(0, 3);
	switch (pos) {
		case 0:
		position[0] = x0;
		position[1] = fight_random_integer(y0, y1);
		break;
		case 1:
		position[0] = fight_random_integer(x0, x1);
		position[1] = y1;
		break;
		case 2:
		position[0] = x1;
		position[1] = fight_random_integer(y0, y1);
		break;
		case 3:
		position[0] = fight_random_integer(x0, x1);
		position[1] = y0;
		break;
	}
	
	return position;
}