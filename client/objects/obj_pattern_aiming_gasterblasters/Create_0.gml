// Arguments: gasterblaster_aiming

callback = function () {
	_soul = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	var stage = irandom_range(1, 2);
	if (stage == 1) {
		update_one();
		time_source_start(time_source_update_one);
		time_source_start(time_source_update_destroy_one);
	}
	else {
		update_two();
		time_source_start(time_source_update_two);
		time_source_start(time_source_update_destroy_two);
	}
}

update_one = function() {
	create_aiming_gasterblaster(gasterblaster_aiming, _soul);
}
	
update_two = function() {
	repeat (2) { create_aiming_gasterblaster(gasterblaster_aiming, _soul); }
}

var period = 50 - _power * 5;
var repeats = 7 + _power;
time_source_update_one = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_one();
}, [], repeats - 1);
	
time_source_update_destroy_one = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});
	
period = 54 - _power * 4;
repeats = 6 + _power;
time_source_update_two = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_two();
}, [], repeats - 1);
	
time_source_update_destroy_two = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});