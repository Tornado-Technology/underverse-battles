function fight_random_outside_position(x_shift = 0, y_shift = 0, sides = [dir.up, dir.down, dir.left, dir.right]) {
	var position = Vector2.zero();
	var min_position = new Vector2(-x_shift, -y_shift);
	var max_position = new Vector2(
		obj_camera.view_width + x_shift,
		obj_camera.view_height + y_shift
	);
	
	var random_index = fight_random_integer(0, array_length(sides) - 1);
	switch (sides[random_index]) {
		case dir.left:
			position.x = min_position.x;
			position.y = fight_random_integer(min_position.y, max_position.y);
			break;
		
		case dir.down:
			position.x = fight_random_integer(min_position.x, max_position.x);
			position.y = max_position.y;
			break;
		
		case dir.right:
			position.x = max_position.x;
			position.y = fight_random_integer(min_position.y, max_position.y);
			break;
		
		case dir.up:
			position.x = fight_random_integer(min_position.x, max_position.x);
			position.y = min_position.y;
			break;
	}
	
	return position;
}