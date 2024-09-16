// Arguments: damage_zone
		
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	x_start = border_instance.x;
	y_start = border_instance.y;		
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_start);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var position_x = fight_random_integer(border_instance.x - border_instance.left + 2, border_instance.x + border_instance.right - 2);
	var position_y = fight_random_integer(border_instance.y - border_instance.up + 2, border_instance.y + border_instance.down - 2);
	
	var random_position = new Vector2(position_x,  position_y);
	var zone_instance = instance_create_depth(random_position.x, random_position.y, fight_depth.bullet_outside, damage_zone);
	
	var shift_max = 25 + _power * 2;
	var change_direction = false
	if (border_instance.x < x_start - shift_max || border_instance.x > x_start + shift_max) {
		border_instance.direction = 180 - border_instance.direction;
		change_direction = true;
	}
			
	if (border_instance.y < y_start - shift_max || border_instance.y > y_start + shift_max) {
		border_instance.direction = - border_instance.direction;
		change_direction = true;
	}
	
}

update_start = function() {
	border_instance.speed_const = 1 + _power * 0.1;
	border_instance.direction = fight_random_choose(0, 90, 180, 270);
}

var period = 16 - _power * 2;
var amount = 20 + _power * 5;

time_source_update_start = time_source_create(time_source_game, 1 / period, time_source_units_seconds, function() {
	update_start();
});

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [], amount - 1);


time_source_update_destroy = time_source_create(time_source_game, period * amount / 60, time_source_units_seconds, function() {
	instance_destroy();
});