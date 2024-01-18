// Arguments: damage_wave
		
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
	var wave_speed = 3.2 + _power * 0.2;
	repeat(3) {
		var coord = [];
		coord = rand_side_from(va_x1_ - 40, va_y1_ - 40, va_x2_ + 40, va_y2_ + 40);
		var _shift_x = irandom_range(-8 - _power, 8 + _power);
		var _shift_y = irandom_range(-8 - _power, 8 + _power);
		var wave_angle = point_direction(coord[0], coord[1], border_instance.x + _shift_x, border_instance.y + _shift_y);
		
		create_damage_wave(coord[0], coord[1], damage_wave, wave_angle, wave_speed, fight_network_mode);
	}
}

var period = 110 - _power * 10;
var repeats = 6 + _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});