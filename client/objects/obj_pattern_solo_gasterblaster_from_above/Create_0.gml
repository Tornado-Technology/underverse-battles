// Arguments: soul_type, gasterblaster, distance, custom_repeats (optional)

max_position = 3;
position = fight_random_integer(0, max_position - 1);

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y + 20, battle_soul_type.red);
		
	var border_dist = 180;
	var gb_period = 35 - _power * 5;
	var rand_pos = fight_random_integer(0, 2);
	var gb_x = border_instance.x - 12;
	if (rand_pos == 1) gb_x = border_instance.x;
	if (rand_pos == 2) gb_x = border_instance.x + 12;
	var gb_x = border_instance.x - 12;
	gasterblaster_instance = create_solo_gasterblaster(gb_x, border_instance.y - border_dist, gasterblaster,
		(gb_period - 6) / 60, gb_period / 60, 15 / 60);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}
	
update = function() {
	position += fight_random_integer(1, max_position - 1);
	if (position >= max_position) {
		position -= max_position;
	}
	
	var gasterblaster_x = border_instance.x - 12;
	if (position == 1) gasterblaster_x = border_instance.x;
	if (position == 2) gasterblaster_x = border_instance.x + 12;
	
	change_solo_gasterblaster_position(gasterblaster, 0, gasterblaster_x, border_instance.y - border_instance.up - distance);
}

var period = 65 - _power * 5;
var repeats = (6 + _power);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});