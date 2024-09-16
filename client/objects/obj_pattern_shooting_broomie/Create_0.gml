// Arguments: brush, custom_repeats (optional)

border_instance.y += 10;

callback = function() {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var brush_speed =  3 + _power * 0.3;
	var offset = 100;
	var postiton_x = fight_random_choose(border_instance.x - border_instance.left - offset, border_instance.x + border_instance.right + offset);
	var postiton_y = border_instance.y; 
	var angle = point_direction(postiton_x, postiton_y, soul_instance.x, soul_instance.y);
	
	instance_create_depth(postiton_x, postiton_y, fight_depth.bullet_outside, brush, {
		image_xscale: -1,
		radius: 30,
		speed_const: brush_speed,
		direction: angle,
		angle_speed_const: postiton_x > border_instance.x ? -1 : 1,
		max_acc: 9,
		image_angle: angle,
		side: -1
	});
}

var period = 60 - _power * 8;
var repeats = 10 + _power * 2;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function() {
	update();
}, [], repeats - 1);

time_source_update_destroy = time_source_create(time_source_game, (period * repeats) / 60 + 2, time_source_units_seconds, function() {
	instance_destroy();
});