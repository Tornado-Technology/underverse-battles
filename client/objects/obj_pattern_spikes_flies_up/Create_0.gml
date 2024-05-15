// Arguments: spike

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
	
	update_spike();
	time_source_start(time_source_update_spike);
	time_source_start(time_source_update_radius_spike);
	time_source_start(time_source_update_destroy);
}

update_radius_spike = function () {
	var radius = 120 - _power * 0.1;
	var _angle = 360 / 4;
	var i = _angle;
	while(i <= 360) {	
		var spike = instance_create_depth(soul_instance.x + dcos(i) * radius, soul_instance.y + -dsin(i) * radius, fight_depth.bullet_outside, obj_spike_target_nightmare);
		spike.speed_const = 2 + _power * 0.1;
		spike.image_angle = point_direction(spike.x, spike.y, soul_instance.x, soul_instance.y);	
		i += _angle;
	}
}


update_spike = function() {
	var spd_spike = 2 + _power * 0.1;
	var offset = irandom_range(0, 190);
	if (irandom(1)) {
		create_spike(border_instance.x - border_instance.left - 10, border_instance.y - border_instance.up + offset, spike, spd_spike, 0);
	}
	else {
		create_spike(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up + offset, spike, spd_spike, 180);
	};
}


var period = 32 - (_power) * 3;
time_source_update_spike = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_spike();
}, [], -1);

time_source_update_radius_spike = time_source_create(time_source_game, 50 / 60, time_source_units_seconds, function () {
	update_radius_spike();	
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (320 + 20 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});