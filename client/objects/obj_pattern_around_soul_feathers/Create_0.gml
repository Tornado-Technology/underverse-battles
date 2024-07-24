/// Arguments: feathers
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var left = border_instance.x - border_instance.left;
	var right = border_instance.x + border_instance.right;
	var up = border_instance.y - border_instance.up;
	var down = border_instance.y + border_instance.down;

	var center_x = fight_random_integer(0, 1) ? fight_random_integer(left - 40, left - 20) : fight_random_integer(right + 40, right + 20);
	var center_y = fight_random_integer(up, down); 

	var angle = 360 / 6;
	var i = angle;
	var r = 30;
	repeat(6) {
		var feathers_instance = instance_create_depth(center_x + dcos(i) * r, center_y + -dsin(i) * r, fight_depth.bullet_outside, feathers, {
			image_angle: i,
			time_destroy: 10,
			center_x: soul_instance.x,
			center_y: soul_instance.y
		});
	
		feathers_instance.radius =  90 - _power * 0.1;
		feathers_instance.speed_count = 4 + _power * 0.1;
		feathers_instance.step = 1 + _power * 0.1;
		with(feathers_instance) {
			impact_on_radius = function () {
				radius -= step;
				if (radius <= 0) {
					time_source_start(time_source_obj_destroy);
				};
			}
			
		};
		i+= angle;
	}
}

var period = 130 - (_power * 2);


time_source_update = time_source_create(time_source_game,  period / 60, time_source_units_seconds, function () {
	update();	
},[], -1)


time_source_update_destroy = time_source_create(time_source_game, (200   / 60) + _power * 2, time_source_units_seconds, function () {
	instance_destroy();
});