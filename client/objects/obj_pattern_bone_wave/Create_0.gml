// Arguments: bone

bone_shift = 0;
wave_time = random_range(0, 2*pi);

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_stop);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var bone_speed = 3 + _power;
	var bone_size = _power < 4 ? 4.4 + bone_shift : 4.5 + bone_shift;
	create_bone(border_instance.x - border_instance.left, border_instance.y + border_instance.down + 20, bone, bone_speed, bone_size, 0, 0);
	create_bone(border_instance.x - border_instance.left, border_instance.y - border_instance.up - 20, bone, bone_speed, 9-bone_size, 0, 180);
	bone_shift = sin(wave_time);
	wave_time += 0.8;
}

var period = 10 - _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

var final_time = (280 + 20 * _power) / 60;
time_source_update_stop = time_source_create(time_source_game, final_time, time_source_units_seconds, function () {
	time_source_stop(time_source_update);
});

time_source_update_destroy = time_source_create(time_source_game, final_time + 0.5, time_source_units_seconds, function () {
	instance_destroy();
});