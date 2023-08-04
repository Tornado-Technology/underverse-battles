// Arguments: bone, gasterblaster_aiming

main_speed = 1 + _power * 0.1;
		
callback = function () {
	create_moving_platforms(border_instance.x - border_instance.left - 40, border_instance.y - 15, 4, 6, 60, main_speed);
	create_moving_platforms(border_instance.x + border_instance.right + 40, border_instance.y + 15, 4, 6, 60, -main_speed);
		
	soul_instance = create_soul(border_instance.x, border_instance.y + border_instance.down - 9, battle_soul_type.blue);
		
	_side = irandom_range(0, 1);
	update_bones();
	time_source_start(time_source_update_bones);
	time_source_start(time_source_update_gasterblasters);
	time_source_start(time_source_update_platforms);
	time_source_start(time_source_update_destroy);
}

update_bones = function() {
	var chance = irandom_range(0, 6);
	if (chance % 2 == 0) {
		create_bone(border_instance.x - border_instance.left, border_instance.y + border_instance.down, bone, main_speed, 1.4, 0, 0);
	}
	if (chance > 2 && chance != 5) {
		create_bone(border_instance.x + border_instance.right, border_instance.y + 15, bone, -main_speed, 1.4, 0, 0);
	}
	if (chance > 4 || chance == 1) {
		create_bone(border_instance.x - border_instance.left, border_instance.y - 15, bone, main_speed, 1.4, 0, 0);
	}
}

update_gasterblasters = function() {
	if (_power >= 3) {
		create_aiming_gasterblaster(gasterblaster_aiming, soul_instance);
		time_source_start(time_source_update_gasterblasters);
	}
}
	
update_platforms = function() {
	create_next_moving_platform(border_instance.x - border_instance.left - 40, border_instance.y - 15, 4, 6, 60, main_speed);
	create_next_moving_platform(border_instance.x + border_instance.right + 40, border_instance.y + 15, 4, 6, 60, -main_speed);
}

time_source_update_bones = time_source_create(time_source_game, (60 - 5 * _power) / 60, time_source_units_seconds, function () {
	update_bones();
}, [], -1);

var repeats = 1 + _power;
time_source_update_gasterblasters = time_source_create(time_source_game, 2, time_source_units_seconds, function () {
	update_gasterblasters();
}, [], repeats);
	
time_source_update_platforms = time_source_create(time_source_game, 1 / main_speed, time_source_units_seconds, function () {
	update_platforms();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (360 + 50 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});