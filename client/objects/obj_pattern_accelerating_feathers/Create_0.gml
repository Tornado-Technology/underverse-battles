/// Arguments: feathers
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var min_random_y = border_instance.y - border_instance.up - 40;
	var max_random_y = border_instance.y + border_instance.down - 30;
	var feathers_x =  border_instance.x - border_instance.left - 90;
	var feathers_y = fight_random_integer(min_random_y, max_random_y);
	
	instance_create_depth(feathers_x, feathers_y, fight_depth.bullet_outside, feathers);
}

time_source_update = time_source_create(time_source_game, (22 - _power * 2) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {
	instance_destroy();
});