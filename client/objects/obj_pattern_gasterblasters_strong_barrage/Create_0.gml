// Arguments: gasterblaster, reversed

_angle = fight_random_integer(0, 359);
angle_step = 10;
steps = 10;

callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_step);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var radius = obj_camera.view_width + object_get_sprite_max_size(gasterblaster);
	var min_radius = border_instance.up + 20;
	var position_x = border_instance.x + radius * dcos(_angle);
	var position_y = border_instance.y + radius * dsin(_angle);
	var final_position_x = border_instance.x + min_radius * dcos(_angle);
	var final_position_y = border_instance.y + min_radius * dsin(_angle);
	create_gasterblaster(gasterblaster, position_x , position_y, final_position_x, final_position_y, point_direction(position_x, position_y, border_instance.x, border_instance.y) + 90, 1/10, 1, 15/60, 1/6);
	_angle += angle_step * (reversed ? -1 : 1);
}
	
update_step = function() {
	angle_step++;
}

var period = 9 - _power;
var repeats = 30 * _power;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], repeats - 1);
	
time_source_update_step = time_source_create(time_source_game, period * (repeats / 60) / steps, time_source_units_seconds, function () {
	update_step();
}, [], steps - 1);
	
time_source_update_destroy = time_source_create(time_source_game, (period * repeats / 60) + 1.4, time_source_units_seconds, function () {
	instance_destroy();
});