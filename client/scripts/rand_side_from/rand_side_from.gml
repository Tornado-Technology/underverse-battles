function rand_side_from(x0, y0, x1, y1){
	var position = [];
	
	var pos = irandom_range(0, 3);
	switch (pos) {
		case 0:
		position[0] = x0;
		position[1] = irandom_range(y0, y1);
		break;
		case 1:
		position[0] = irandom_range(x0, x1);
		position[1] = y1;
		break;
		case 2:
		position[0] = x1;
		position[1] = irandom_range(y0, y1);
		break;
		case 3:
		position[0] = irandom_range(x0, x1);
		position[1] = y0;
		break;
	}
	
	return position;
}