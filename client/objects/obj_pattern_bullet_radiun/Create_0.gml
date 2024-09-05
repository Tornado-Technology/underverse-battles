/// Arguments: clubs	
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
			
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var radius = 95;
	var bullet_counst = 6;
	var point_in_circle_ = 360 / bullet_counst;
	var i =  point_in_circle_;
	var angle = fight_random_integer(10, 300);
	var j = 2 - _power * 0.1;
	repeat(bullet_counst) {
		var position_x = border_instance.x + dcos(angle) * radius;
		var position_y = border_instance.y + -dsin(angle) * radius;
		var bullet_instance = instance_create_depth(position_x, position_y, fight_depth.bullet_outside_hight, clubs, {
			time_attack: (30 - (_power * 0.1)) + j, 
			speed_count: 3 + _power * 0.1,
			center_x: border_instance.x,
			center_y: border_instance.y
		});
		
		bullet_instance.angle = angle;
		bullet_instance.length_charge =  0.02 +_power * 0.01;
		bullet_instance.step = 0.1 * _power + 0.02;
		angle += point_in_circle_;
		i += point_in_circle_;
		j += 5;
	}
}

var period = (75 - (_power));
var repeats = 5 + _power;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], period - 1);
time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});