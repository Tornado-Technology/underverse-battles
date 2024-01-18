// Arguments: knife

rot = irandom_range(0, 1);
_side = choose(0, 90, 180, 270);
step = 20;
		
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var dist_ = 120;
	var rX = border_instance.x - dist_ * cos(_side * pi / 180);
	var rY = border_instance.y - dist_ * sin(_side * pi / 180);
	create_battle_object(rX, rY, 0, knife, {
		image_alpha: 0,
		_target_angle: point_direction(rX, rY, border_instance.x, border_instance.y),
	}, fight_network_mode);
	if (rot == 0)
		_side += step;
	else
		_side -= step;
}

var period = 15 - _power * 2;
var amount = 18 + _power*6;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_direction = time_source_create(time_source_game, (80 - _power * 5) / 60, time_source_units_seconds, function () {
	var rand_num = irandom_range(0, 1);
	if (rand_num == 0)
		rot = rot ? 0 : 1;
}, [], -1);
time_source_update_stop = time_source_create(time_source_game, period * amount / 60, time_source_units_seconds, function () {
	instance_destroy();
	time_source_start(time_source_update_destroy);
});
time_source_update_destroy = time_source_create(time_source_game, 1, time_source_units_seconds, function () {
	instance_destroy();
});