// Arguments: brush, max_acceleration, custom_repeats (optional)

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var coord = [];
	coord = rand_side_from(border_instance.x - border_instance.left - 8, border_instance.y - border_instance.up - 8, border_instance.x + border_instance.right + 8, border_instance.y + border_instance.down + 8);
	create_broomie(coord[0], coord[1], brush,
		point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y) + 225, -1, -1, max_acceleration);
}

var period = 80 - _power * 12;
var repeats = 6 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});