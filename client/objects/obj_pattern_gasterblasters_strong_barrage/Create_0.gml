// Arguments: gasterblaster, reversed

_angle = irandom_range(0, 359);
angle_step = 10;
steps = 8;

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_step);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var radius = border_instance.up * 2;
	var x_gb = border_instance.x + radius * cos(degtorad(_angle));
	var y_gb = border_instance.y + radius * sin(degtorad(_angle));
	create_gasterblaster(gasterblaster, x_gb, y_gb, border_instance.x, border_instance.y, point_direction(x_gb, y_gb, border_instance.x, border_instance.y) + 90, 1/8, 1, 15/60, 1/6);
	_angle += angle_step * (reversed ? -1 : 1);
}
	
update_step = function() {
	angle_step++;
}

var period = 9 - _power;
var repeats = 30 * _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
	
time_source_update_step = time_source_create(time_source_game, period * (repeats / 60) / steps, time_source_units_seconds, function () {
	update_step();
}, [], steps - 1);
	
time_source_update_destroy = time_source_create(time_source_game, (period * repeats / 60) + 1.4, time_source_units_seconds, function () {
	instance_destroy();
});