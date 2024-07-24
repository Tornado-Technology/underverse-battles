/// Arguments: clubs	
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
			
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var radius = 100;
	var angle = fight_random_integer(0, 460);
	var bullet_counst = (_power div 2 + 6);
	var point_in_circle_ = 360 / bullet_counst;
	var i = point_in_circle_;
	var j = 2 - _power * 0.1;
	var moving = fight_random_integer(0, 1) ? point_in_circle_ : -point_in_circle_;
	
	while(i <= 360) {
		var x_ = border_instance.x + dcos(angle) * radius;
		var y_ = border_instance.y + -dsin(angle) * radius;
		var bullet_instance = instance_create_depth(x_, y_, fight_depth.bullet_outside_hight, clubs, {
			time_attack: (30 - (_power * 0.1)) + j, 
			speed_count: 3 + _power * 0.1,
			angle: point_direction(x_, y_, border_instance.x, border_instance.y),
			center_x: border_instance.x,
			center_y: border_instance.y
		});
		
		bullet_instance.length_charge =  0.02 +_power * 0.01;
		bullet_instance.step = 0.1 * _power + 0.02;
		angle += moving;
		i += point_in_circle_;
		j += 5;
	}
}

var period = (80 - (_power * 2))

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (300 + _power * 20) / 60, time_source_units_seconds, function () {
	instance_destroy();
});