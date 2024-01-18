// Arguments: knife
		
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var va_x1_ = obj_camera.camera_position.x;
	var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
	var va_y1_ = obj_camera.camera_position.y;
	var va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;
	var rX = irandom_range(va_x1_ + 64, va_x2_ - 64);
	var rY = irandom_range(va_y1_ + 24, va_y2_ - 24);
	while(point_in_rectangle(rX, rY, border_instance.x - border_instance.left, border_instance.y - border_instance.up, border_instance.x + border_instance.right, border_instance.y + border_instance.down)) {
		rX = irandom_range(va_x1_ + 64, va_x2_ - 64);
		rY = irandom_range(va_y1_ + 24, va_y2_ - 24);
	}
	
	create_battle_object(rX, rY, 0, knife, {
		_target_angle: point_direction(rX, rY, soul_instance.x, soul_instance.y),
	}, fight_network_mode);
}

time_source_update = time_source_create(time_source_game, (18 - _power * 2) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {
	instance_destroy();
});