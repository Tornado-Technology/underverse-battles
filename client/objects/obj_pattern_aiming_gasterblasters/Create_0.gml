// Arguments: gasterblaster_aiming, count, custom_repeats (optional)

callback = function () {
	_soul = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);

	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}
	
update = function() {
	repeat (count) { create_aiming_gasterblaster(gasterblaster_aiming, _soul); }
}

var period = (46 + count * 4) - _power * (6 - count > 0 ? 6 - count : 1);
var repeats = 8 + _power - count;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
	
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});