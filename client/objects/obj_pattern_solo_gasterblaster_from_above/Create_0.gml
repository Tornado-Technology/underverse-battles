// Arguments: soul_type, gasterblaster, custom_repeats (optional)

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
	var border_dist = 180;
	var period = 50 - _power * 5;
	var rand_pos = irandom_range(0, 2);
	var gb_x = border_instance.x - 12;
	if (rand_pos == 1) gb_x = border_instance.x;
	if (rand_pos == 2) gb_x = border_instance.x + 12;
	var gb_x = border_instance.x - 12;
	gasterblaster_instance = instance_create_depth(gb_x, border_instance.y - border_dist, fight_depth.bullet_outside_hight, gasterblaster, {
		target_time: (period - 10) / 60,
		charge_time: period / 60,
		destroy_time: 15 / 60
	});
		
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}
	
update = function() {
	var rand_pos = irandom_range(0, 2);
	var gb_x = border_instance.x - 12;
	if (rand_pos == 1) gb_x = border_instance.x;
	if (rand_pos == 2) gb_x = border_instance.x + 12;
	gasterblaster_instance.x_dir = gb_x;
}

var period = 65 - _power * 5;
var repeats = (5 + _power);

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});