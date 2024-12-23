// Arguments:  rotating_tentacle, spike
callback = function () {
	var tentacles_instance;
	var target;
	
	rotating_multiplier = fight_random_choose(-1, 1);
	soul_instance = create_soul(border_instance.x + 35 * rotating_multiplier, border_instance.y, battle_soul_type.red);
	
	border = {
		up: border_instance.y - border_instance.up,
		down: border_instance.y + border_instance.down,
		left: border_instance.x - border_instance.left,
		right: border_instance.x + border_instance.right		
	}

	tentacles_instance = instance_create_depth(border_instance.x, border_instance.y, fight_depth.bullet_outside_hight, rotating_tentacle);
	target = new Vector2(border.right - 40, border.up);
	
	tentacles_instance.image_angle = point_direction(tentacles_instance.x, tentacles_instance.y, target.x, target.y);
	tentacles_instance.rotating_speed = (1 + _power * 0.1) * rotating_multiplier;
	tentacles_instance.image_xscale = 2;

	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () { 
	var _x = fight_random_integer(border_instance.x - border_instance.left, border_instance.x + border_instance.right);
	var _y = fight_random_integer(border_instance.y - border_instance.up - 10, border_instance.y + border_instance.down + 20);
	var spike_instance;
	var border_left_right = fight_random_choose(border.left - 10, border.right + 10);
	var border_up_down = fight_random_choose(border.down + 10, border.up - 10);
	
	if(fight_random_integer(0, 1)) {
		spike_instance = instance_create_depth(_x, border_up_down, fight_depth.bullet_outside_hight, spike, {
			direction: point_direction(_x, border_up_down, border_instance.x, border_instance.y), 
			image_angle: point_direction(_x, border_up_down, border_instance.x, border_instance.y)
		});
	} else {
		spike_instance = instance_create_depth(border_left_right, _y, fight_depth.bullet_outside_hight, spike, {
			direction: point_direction(border_left_right, _y, border_instance.x, border_instance.y), 
			image_angle: point_direction(border_left_right, _y, border_instance.x, border_instance.y)
		});
	}
		
	spike_instance.speed_const = 2 + _power * 0.2;
	
	audio_play_sound_plugging(snd_projectile);
}

var period = 36 - _power * 3;
var repeats = 10 + _power * 3;

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();	
},[], -1);

time_source_update_destroy = time_source_create(time_source_game,  period * repeats / 60 + 1.1, time_source_units_seconds, function () {
	instance_destroy();	
});