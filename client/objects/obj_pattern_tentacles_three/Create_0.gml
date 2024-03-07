// Arguments:  thread_tentacles, spike
callback = function () {
	soul_instance = create_soul(border_instance.x + 30, border_instance.y, battle_soul_type.red);
	
	var border = {
		up : border_instance.y - border_instance.up,
		down : border_instance.y + border_instance.down,
		left : border_instance.x - border_instance.left,
		right : border_instance.x + border_instance.right		
	}

		var tentacles_instance = instance_create_depth(border_instance.x, border_instance.y, fight_depth.bullet_outside_hight, thread_tentacles);
		var target = new Vector2(border.right - 40 , border.up);
		tentacles_instance.image_angle = point_direction(tentacles_instance.x, tentacles_instance.y, target.x, target.y);
		tentacles_instance.scale_speed = 2 + _power * 0.2;
		tentacles_instance.image_xscale = 100;

	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () { 
		var offset = irandom_range(10, 160);
		var spike_instance = instance_create_depth(border_instance.x - border_instance.left + offset, border_instance.y - border_instance.up - 20, fight_depth.bullet_outside_hight, spike, {
			direction : 270, 
			image_angle : 270
		});
		spike_instance.speed_const = 3 + _power * 0.2;
}


var period = 33 - 2 -  _power * 2;
var repeats = 15 + _power * 3;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
},[], -1);


time_source_update_destroy = time_source_create(time_source_game,  period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
})