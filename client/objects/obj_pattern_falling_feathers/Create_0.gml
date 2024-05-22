		
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var min_random_x = border_instance.x-border_instance.left-30;
	var max_random_x = border_instance.x+border_instance.right+30;
	var feathers_y =  border_instance.y-border_instance.up;
	var feathers_x = fight_random_integer( min_random_x, max_random_x)
	
	instance_create_depth(feathers_x,feathers_y, fight_depth.bullet_outside, feathers);
}

time_source_update = time_source_create(time_source_game, (18 - _power * 2) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (360 + _power * 30) / 60, time_source_units_seconds, function () {
	instance_destroy();
});