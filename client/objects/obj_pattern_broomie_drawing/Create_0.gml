// Arguments: brush, max_acceleration, custom_repeats (optional)

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var offset = 100;
	var postiton_x = fight_random_choose(border_instance.x - border_instance.left - offset, border_instance.x + border_instance.right + offset);
	var postiton_y = fight_random_integer(border_instance.y - border_instance.up, border_instance.y + border_instance.down);

	
	var angle = point_direction(postiton_x, postiton_y, soul_instance.x, soul_instance.y) + 225;
	instance_create_depth(postiton_x, postiton_y, fight_depth.bullet_outside, brush, {
		 radius: 30,
		speed_const: 3 + _power * 0.3,
		direction: angle,
		angle_speed_const: 1,
		max_acc: fight_random_integer(7, 18),
		image_angle: direction,
		side: -1
	});
	
}

var period = 80 - (_power * 12);
var repeats = 6 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60, time_source_units_seconds, function () {
	instance_destroy();
});