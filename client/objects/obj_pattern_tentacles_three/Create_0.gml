// Arguments:  thread_tentacles, spike
callback = function () {
	var tentacles_instance;
	var target;
	
	soul_instance = create_soul(border_instance.x + 30, border_instance.y, battle_soul_type.red);
	
	border = {
		up: border_instance.y - border_instance.up,
		down: border_instance.y + border_instance.down,
		left: border_instance.x - border_instance.left,
		right: border_instance.x + border_instance.right		
	};

	tentacles_instance = instance_create_depth(border_instance.x, border_instance.y, fight_depth.bullet_outside_hight, thread_tentacles);
	target = new Vector2(border.right - 40 , border.up);
	
	tentacles_instance.image_angle = point_direction(tentacles_instance.x, tentacles_instance.y, target.x, target.y);
	tentacles_instance.scale_speed = 2 + _power * 0.2;
	tentacles_instance.image_xscale = 2;

	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () { 
	var i = fight_random_integer(0, 1);
	var _x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	var _y = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 10);
	var spike_instance = [];
	var border_left_right = fight_random_choose(border.left, border.right);
	var border_up_down = fight_random_choose(border.down, border.up);
	
	spike_instance = [
		instance_create_depth(_x, border_up_down, fight_depth.bullet_outside_hight, spike, {
			direction: point_direction(_x, border_up_down, border_instance.x, border_instance.y), 
			image_angle: point_direction(_x, border_up_down, border_instance.x, border_instance.y)
		}),
		instance_create_depth(border_left_right, _y, fight_depth.bullet_outside_hight, spike, {
			direction: point_direction(border_left_right, _y, border_instance.x, border_instance.y), 
			image_angle: point_direction(border_left_right, _y, border_instance.x, border_instance.y)
		})
	];
		
	spike_instance[i].speed_const = 3 + _power * 0.2;
}


var period = 33 - ( _power * 2);
var repeats = 15 + (_power * 3);

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
},[], -1);


time_source_update_destroy = time_source_create(time_source_game,  period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();	
});