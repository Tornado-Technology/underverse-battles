// Arguments: brush, max_acceleration, custom_repeats (optional)

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var position_index = fight_random_integer(0, 3);
	
	var broomie_x = border_instance.x - border_instance.left - 8;
	var broomie_y = border_instance.y;
	var broomie_direction = fight_random_choose(-90, 90);
	var broomie_angle_speed = sign(broomie_direction);
	switch (position_index) {
		case 1:
			var broomie_x = border_instance.x + border_instance.right + 8;
			var broomie_y = border_instance.y;
			var broomie_direction = fight_random_choose(-90, 90);
			var broomie_angle_speed = -sign(broomie_direction);
			break;
		case 2:
			var broomie_x = border_instance.x;
			var broomie_y = border_instance.y - border_instance.up - 8;
			var broomie_direction = fight_random_choose(-360, 180);
			var broomie_angle_speed = -sign(broomie_direction);
			break;
		case 3:
			var broomie_x = border_instance.x;
			var broomie_y = border_instance.y + border_instance.down + 8;
			var broomie_direction = fight_random_choose(-360, 180);
			var broomie_angle_speed = sign(broomie_direction);
			break;
	}

	create_broomie(broomie_x, broomie_y, brush,
		broomie_direction, -1, broomie_angle_speed, max_acceleration);
}

var period = 80 - _power * 12;
var repeats = 6 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});