// Arguments: spike

callback = function () {
	soul_instance = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);
		
	update_bone();
	time_source_start(time_source_update_spike);
	time_source_start(time_source_update_bone);
	time_source_start(time_source_update_destroy);
}

update_spike = function() {
	var coord = rand_side_from(border_instance.x - border_instance.left - 20, border_instance.y - border_instance.up - 20, border_instance.x + border_instance.right + 20, border_instance.y + border_instance.down + 20);
	var spike_direction = point_direction(coord[0], coord[1], soul_instance.x, soul_instance.y);
	create_spike(coord[0], coord[1], spike, 2 + _power * 0.2, spike_direction);
}

var period = 22 - _power * 3;
time_source_update_spike = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update_spike();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (320 + 20 * _power) / 60, time_source_units_seconds, function () {
	instance_destroy();
});