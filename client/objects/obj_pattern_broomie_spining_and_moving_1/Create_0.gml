// Arguments: brush, max_acceleration

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var offset = 70;
	var postiton_x = fight_random_choose(border_instance.x - border_instance.left - offset, border_instance.x + border_instance.right + offset);
	var postiton_y = fight_random_integer(border_instance.y - border_instance.up + 50, border_instance.y + border_instance.down - 50);	
	
var broomie_instance = 	create_broomie( postiton_x, postiton_y , brush,
		point_direction(postiton_x, postiton_y , soul_instance.x, soul_instance.y) + 225, -1, 1, max_acceleration);
		broomie_instance.speed_const = 3 + _power * 0.1;
		
}

var period = 85 - _power * 10;
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