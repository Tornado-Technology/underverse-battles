/// Arguments: feathers
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var feathers_instance;
	var angle = 360 / 6;
	var i = angle;
	var speed_feathers = 3 + _power * 0.1;
	var is_versa = fight_random_integer(0, 1);
	var step = 0.7 + _power * 0.1;
	var radius = 90;
	repeat(6) {
		feathers_instance = instance_create_depth(border_instance.x + dcos(i) * radius, border_instance.y + -dsin(i) * radius, fight_depth.bullet_outside, feathers, {
			image_angle: i,
			time_destroy: 10,
			center_x: border_instance.x,
			center_y: border_instance.y
		});

		feathers_instance.radius = radius + 20;
		feathers_instance.is_versa = is_versa;
		feathers_instance.speed_count = speed_feathers;
		feathers_instance.step = step;
		with(feathers_instance) {
			impact_on_radius = function () {
				radius -= step;
				if (radius <= -10) {
					moving_radius = false;
					motion_set(image_angle, speed_count * dtime);
				};
			}		
		}
		i+= angle;			
	}
}


var period = 70 - (_power);
var repeats = 5 + _power;

time_source_update = time_source_create(time_source_game,  period / 60, time_source_units_seconds, function () {
	update();	
},[],  repeats - 1);


time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});