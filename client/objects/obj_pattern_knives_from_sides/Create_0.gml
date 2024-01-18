// Arguments: knife, sides
		
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var index = irandom_range(0, array_length(sides) - 1);
	var knife_instance = noone;
	
	var position_x = irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	var position_y = obj_camera.camera_position.y + 10 + border_instance.up;
	var target_angle = 270;
	
	switch (sides[index]) {
		case dir.up:
			position_x = irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
			position_y = obj_camera.camera_position.y + border_instance.up;
			target_angle = 270;
			break;
		case dir.down:
			position_x = irandom_range(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
			position_y = obj_camera.camera_position.y - border_instance.down;
			target_angle = 90;
			break;
		case dir.left:
			position_x = obj_camera.camera_position.x + 30 + border_instance.left;
			position_y = irandom_range(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
			target_angle = 0;
			break;
		case dir.right:
			position_x = obj_camera.camera_position.x - 30 - border_instance.right;
			position_y = irandom_range(border_instance.y - border_instance.up, border_instance.y + border_instance.down);
			target_angle = 180;
			break;
	}
	
	create_battle_object(position_x, position_y, 0, knife, {
		image_alpha: 0,
		_target_angle: point_direction(position_x, position_y, border_instance.x, border_instance.y),
	}, fight_network_mode);
}

time_source_update = time_source_create(time_source_game, (14 - _power * 2) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (280 + _power * 30) / 60, time_source_units_seconds, function () {
	instance_destroy();
});