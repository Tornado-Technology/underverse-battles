// Arguments: knife, sides
		
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var index = fight_random_integer(0, array_length(sides) - 1);
	var knife_instance = noone;
	
	var position_x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	var position_y = obj_camera.camera_position.y + 10 + border_instance.up;
	var target_angle = 270;
	
	switch (sides[index]) {
		case dir.up:
			position_x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
			position_y = border_instance.y - border_instance.up - 30;
			target_angle = dir.up;
			break;
		case dir.down:
			position_x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
			position_y = border_instance.y + border_instance.down + 30;
			target_angle = dir.down;
			break;
		case dir.left:
			position_x = border_instance.x - border_instance.left - 30;
			position_y = fight_random_integer(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
			target_angle = dir.right;
			break;
		case dir.right:
			position_x = border_instance.x + border_instance.right + 30;
			position_y = fight_random_integer(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
			target_angle = dir.left;
			break;
	}
	
	instance_create_depth(position_x, position_y, 0, knife, {
		image_alpha: 0,
		_target_angle: target_angle
	});
}

time_source_update = time_source_create(time_source_game, (14 - _power * 2) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (280 + _power * 30) / 60, time_source_units_seconds, function () {
	instance_destroy();
});