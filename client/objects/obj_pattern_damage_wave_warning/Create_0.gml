// Arguments: damage_wave, zone_damage_wave
		
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update_zone();
	time_source_start(time_source_update_zone);
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update_zone = function() {
	var i = 0;
	var num = 4 + round(_power / 2);
	var va_x1_ = obj_camera.camera_position.x;
	var va_x2_ = obj_camera.view_width + obj_camera.camera_position.x;
	var va_y1_ = obj_camera.camera_position.y;
	var va_y2_ = obj_camera.view_height + obj_camera.camera_position.y;
	repeat(num) {
		coord_wave[i] = rand_side_from(va_x1_ - 40, va_y1_ - 40, va_x2_ + 40, va_y2_ + 40);
		zone_instances[i] = instance_create_depth(coord_wave[i, 0], coord_wave[i, 1], fight_depth.bullet_outside_hight, zone_damage_wave);
		zone_instances[i].x_side = soul_instance.x;
		zone_instances[i].y_side = soul_instance.y;
		zone_instances[i].show_zone = true;
		i++;
	}
	audio_play_sound_plugging(snd_warning);
}
	
update = function() {
	var i = 0;
	var num = 4 + round(_power / 2);
	var wave_speed = (3.2 + _power * 0.2) * 1.4;
	repeat(num) {
		var wave_angle = point_direction(coord_wave[i, 0], coord_wave[i, 1], zone_instances[i].x_side, zone_instances[i].y_side);
		create_damage_wave(coord_wave[i, 0], coord_wave[i, 1], damage_wave, wave_angle, wave_speed);
		instance_destroy(zone_instances[i]);
		i++;
	}
}

var period = 100 - _power * 10;
var repeats = 4 + _power;
time_source_update_zone = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_zone();
	time_source_start(time_source_update);
}, [], repeats - 1);
time_source_update = time_source_create(time_source_game, 0.5, time_source_units_seconds, function () {
	update();
});
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});