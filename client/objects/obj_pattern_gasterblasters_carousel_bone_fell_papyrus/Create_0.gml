// Arguments: soul_type, gasterblaster_aiming, count, custom_repeats (optional)

callback = function () {
	soul_instance =  create_soul(border_instance.x, border_instance.y, battle_soul_type.blue);
	
	
	var angle = 360 / 8;
	var radius = 10;
	var i = angle;
	while(i <= 360) {
		instance_create_depth(border_instance.x + dcos(angle) * radius, border_instance.y + -dsin(angle) * radius, fight_depth.bullet_outside, obj_bone_carousel_fell_papyrus, {
			image_yscale: 4.5,
			speed_const: 1 + _power * 0.1,
			image_angle: i
		});
		
		
		i += angle;
	}
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}
	
update = function() {
	var position_x = fight_random_choose(border_instance.x - border_instance.left - 30, border_instance.x + border_instance.right + 30);
	var position_y = fight_random_integer(border_instance.y - border_instance.up + 10, border_instance.y + border_instance.down - 20);
	var angle = point_direction(position_x, position_y, border_instance.x, position_y);
	
	create_gasterblaster(gasterblaster, position_x, position_y, position_x, position_y, angle + 90, 1/6, 1 - (_power - count) * 0.1, 15/ 60, 1/6, 10);
	
}

var period = 46 - _power * 6 + count * 3;
var repeats = 9 + _power - count;

if (variable_instance_exists(id, "custom_repeats")) {
	repeats = custom_repeats;
}

time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
	
time_source_update_destroy = time_source_create(time_source_game, period * repeats / 60 + 1, time_source_units_seconds, function () {
	instance_destroy();
});