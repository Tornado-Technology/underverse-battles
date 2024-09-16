// Arguments: bomb,  spike

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	var offet = fight_random_integer(30, 80);
	var _xx = fight_random_choose(border_instance.x - border_instance.left - offet, border_instance.x + border_instance.right + offet);
	var _yy = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
		
	create_bow(bow, arrows, 3 + _power * 0.3, true, _xx, _yy,  point_direction(_xx, _yy, soul_instance.x, soul_instance.y),   1 / 6,  0.7 - _power * 0.1,  0.5 - _power * 0.1);	
	
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
};

update = function() {
	var offet = fight_random_integer(30, 80);
	var _xx = fight_random_choose(border_instance.x - border_instance.left - offet, border_instance.x + border_instance.right + offet);
	var _yy = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
		
	create_bow(bow, arrows, 3 + _power * 0.3, true, _xx, _yy,  point_direction(_xx, _yy, soul_instance.x, soul_instance.y),   1 / 6,  0.7 - _power * 0.1,  0.5 - _power * 0.1);
}

var period = 60 - (_power * 2);
var repeats = 8 + (_power * 2);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, update, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});