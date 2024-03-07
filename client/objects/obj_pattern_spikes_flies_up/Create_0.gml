// Arguments: spike

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
	
	update_spike();
	update_spike_times();
	time_source_start(time_source_update_spike);
	time_source_start(time_source_update_spike_times);
	time_source_start(time_source_update_destroy);
}

update_spike = function() {
	var spd_spike = 2 + _power * 0.1;
	var offset = irandom_range(0, 190);
	if (irandom_range(0, 1)) {
		create_spike(border_instance.x - border_instance.left - 10, border_instance.y - border_instance.up + offset, spike, spd_spike, 0);
	}
	else {
		create_spike(border_instance.x + border_instance.right + 10, border_instance.y - border_instance.up + offset, spike, spd_spike, 180);
	}
}


update_spike_times = function () {
	var  distance_factor = 0;
	var spike_direction = 90; 
	var spike_counst = 16;
	repeat (spike_counst) {
		var spike_01 = instance_create_depth(border_instance.x - border_instance.left + 10 * distance_factor, border_instance.y - border_instance.up, fight_depth.bullet_outside, spike_timer, {
			time_charget: (90 + distance_factor * 7) / 40,
			charger: border_instance.y - border_instance.up - 10
		});
		spike_01.speed_const = 3 + _power * 0.2;
		spike_01.direction = spike_direction * 3;
		spike_01.image_angle = spike_direction * 3;	
	 distance_factor++;
	}
	
}

var period = 32 - (_power) * 3;
time_source_update_spike = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_spike();
}, [], -1);

time_source_update_spike_times = time_source_create(time_source_game, 30 * 3 / 60, time_source_units_seconds, function () {
	update_spike_times();
}, [], -1)

time_source_update_destroy = time_source_create(time_source_game, (320 + 20 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});