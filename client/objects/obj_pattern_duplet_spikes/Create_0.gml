// Arguments: spike

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var side = fight_random_integer(0, 1);
	var x_rand;
	var spike_direction = 0;
	if (side == 0) {
		x_rand = border_instance.x - border_instance.left - 10;
		spike_direction = 0;
	}
	else {
		x_rand = border_instance.x + border_instance.right + 10;
		spike_direction = 180;
	}
	var y_rand = fight_random_integer(border_instance.y - border_instance.up, border_instance.y + border_instance.down - 10);
	create_spike(x_rand, y_rand, spike, 2 + _power * 0.2, spike_direction);
	create_spike(x_rand, y_rand + 10, spike, 2 + _power * 0.2, spike_direction);
}

var period = 22 - _power * 3;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (340 + 20 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});