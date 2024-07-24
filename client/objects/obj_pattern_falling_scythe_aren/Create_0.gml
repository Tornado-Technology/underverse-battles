/// Arguments: scythe_falling

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var x0 = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);

	var scythe_instance = instance_create_depth(x0, border_instance.y - border_instance.up - 50, fight_depth.bullet_outside_hight, scythe_falling, {
		angle: 270,
		angle_blast: 180
	});
	
	scythe_instance.speed_count = 3 + _power * 0.1;
}

var period = 40 - _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

time_source_update_destroy = time_source_create(time_source_game, (300 + _power * 30) / 60 + 0.5, time_source_units_seconds, function () {
	instance_destroy();
});