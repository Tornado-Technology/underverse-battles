// Arguments bow, arrow

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update_destroy);
};

	
update = function () {
	var offet = fight_random_integer(30, 80);
	var _xx = fight_random_choose(border_instance.x - border_instance.left - offet, border_instance.x + border_instance.right + offet);
	var _yy = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
	
	instance_create_depth(_xx, _yy, fight_depth.bullet_outside, bow, {
		target_time: 1,
		shot_time: 0.7,
		destroy_time: 0.1,
		_power: _power,
		arrows: arrows,
		speed_const: 3
	});					
}


time_source_update_destroy = time_source_create(time_source_game,  1 / 60, time_source_units_seconds, function () {
	instance_destroy();	
});	
	