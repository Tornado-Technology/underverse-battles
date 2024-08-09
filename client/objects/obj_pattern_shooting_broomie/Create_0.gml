// Arguments: brush, custom_repeats (optional)

border_instance.y += 10;

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function () {
	var offset = 100;
	var angle;
	var postiton_x;
	var postiton_y; 
	var speed_brush =  3 + _power * 0.3;
	postiton_x = fight_random_choose(border_instance.x - border_instance.left - offset, border_instance.x + border_instance.right + offset);
	postiton_y = border_instance.y; 
	angle = point_direction(postiton_x, postiton_y, soul_instance.x, soul_instance.y);	 
	
	instance_create_depth(postiton_x, postiton_y, fight_depth.bullet_outside, brush, {
		image_xscale: -1,
		radius: 30,
		speed_const: speed_brush,
		direction: angle,
		angle_speed_const: postiton_x > border_instance.x ? -1 : 1,
		max_acc: fight_random_integer(7, 18),
		image_angle: angle,
		side: -1
	});
	
}

var period = 80 - (_power * 12);
var repeats = 10 + _power;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 1.5, time_source_units_seconds, function () {
	instance_destroy();
});