// Arguments: damage_zone
		
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_kinfe);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var random_position = new Vector2(fight_random_integer(border_instance.x - border_instance.left + 2, border_instance.x + border_instance.right - 2), fight_random_integer(border_instance.y - border_instance.up + 2, border_instance.y + border_instance.down - 2));
	instance_create_depth(random_position.x, random_position.y, fight_depth.bullet_outside, damage_zone, {});
}

update_kinfe = function() {
	var va_x1_ = obj_camera.camera_position.x;
	var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
	var va_y1_ = obj_camera.camera_position.y;
	var va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;
	var rX = fight_random_integer(va_x1_ + 64, va_x2_ - 64);
	var rY = fight_random_integer(va_y1_ + 24, va_y2_ - 24);
	while(point_in_rectangle(rX, rY, border_instance.x - border_instance.left, border_instance.y - border_instance.up, border_instance.x + border_instance.right, border_instance.y + border_instance.down)) {
		rX = fight_random_integer(va_x1_ + 64, va_x2_ - 64);
		rY = fight_random_integer(va_y1_ + 24, va_y2_ - 24);
	}
	
	instance_create_depth(rX, rY, 0, knife, {
		_target_angle: point_direction(rX, rY, soul_instance.x, soul_instance.y),
	});
}



var period = 16 - _power * 2;
var period_kinfe =  40 - (_power * 2);
var amount = 15 + _power * 5;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], amount - 1);

time_source_update_kinfe = time_source_create(time_source_game, period_kinfe / 60, time_source_units_seconds, function () {
	update_kinfe();	
}, [], amount - 1);

time_source_update_destroy = time_source_create(time_source_game, period * amount / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});