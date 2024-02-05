// Arguments: soul_type, gasterblaster_aiming, custom_repeats (optional)

callback = function () {
	soul_instance = soul_type == battle_soul_type.blue ?
		create_soul(border_instance.x, border_instance.y + border_instance.down - 8, soul_type) :
		create_soul(border_instance.x, border_instance.y, soul_type);

	var period = 50 - _power * 5;
	var gb_size = 60;
	var con = room_height + gb_size;
	var coord = rand_side_from(-gb_size, -gb_size, con, con);
	gasterblaster_instance = instance_create_depth(coord[0], coord[1], fight_depth.bullet_outside_hight, gasterblaster_aiming, {
		target_time: (period - 8 + _power) / 60,
		charge_time: period / 60,
		destroy_time: 15 / 60
	});
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}
	
update = function() {
	var coord_new = rand_side_from(border_instance.x - border_instance.left, border_instance.y - border_instance.up, border_instance.x + border_instance.right, border_instance.y + border_instance.down);
	change_solo_gasterblaster_position(gasterblaster_instance, 0, coord_new[0], coord_new[1]);
	change_solo_gasterblaster_target(gasterblaster_instance, 0, soul_instance);
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