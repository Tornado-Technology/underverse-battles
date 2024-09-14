// Arguments: big_knife, knife

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	knife_instance = create_big_knife_x(border_instance.x - border_instance.left - 30, border_instance.y, big_knife, 0, 0, border_instance.x + border_instance.right + 20);
	
	time_source_start(time_source_update);
	time_source_start(time_source_update_knife);
	time_source_start(time_source_update_destroy);
}

update = function() {
	knife_instance.spin(fight_random_choose(-1, 1) * (3 + _power * 0.2));
	knife_instance.move(3 + _power * 0.2);
}

update_knife = function() {
	var knife_direction = fight_random_choose(dir.up, dir.down);
	
	var knife_x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	var knife_y = knife_direction == dir.up ? border_instance.y + border_instance.down + 60 : border_instance.y - border_instance.up - 60;
	instance_create_depth(knife_x, knife_y, fight_depth.bullet_outside, knife, {
		image_alpha: 0,
		_speed: 1.2 + _power * 0.1,
		_target_angle: knife_direction
	});
}

time_source_update = time_source_create(time_source_game, 0.5, time_source_units_seconds, function() {
	update();
});

time_source_update_knife = time_source_create(time_source_game, (40 - _power * 2) / 60, time_source_units_seconds, function() {
	update_knife();
}, [], -1);
	
time_source_update_destroy = time_source_create(time_source_game, (240 + 70 * _power) / 60, time_source_units_seconds, function() {
	instance_destroy();
});