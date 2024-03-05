// Arguments: drops

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var x0 = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	var drop_index = fight_random_integer(0, array_length(drops) - 1);
	create_drop(x0, border_instance.y - border_instance.up - 5, drops[drop_index], 1.5 + _power * 0.1, 270, false);
}

var period = 10 - _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (300 + _power * 30) / 60 + 0.5, time_source_units_seconds, function () {
	instance_destroy();
});