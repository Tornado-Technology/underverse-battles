// Arguments: bone

callback = function () {
	soul_instance = create_soul(border_instance.x - border_instance.left + 35, border_instance.y + 2, battle_soul_type.blue, fight_network_mode);
	
	platform_instance = create_solo_moving_platform(border_instance.x - border_instance.left + 20, border_instance.y + 10,
		5, 0.4 + _power * 0.1, border_instance.x - border_instance.left + 20, border_instance.x + border_instance.right - 40, fight_network_mode);
	
	var x_position = border_instance.x - border_instance.left;
	while (x_position < border_instance.x + border_instance.right) {
		create_bone(x_position, border_instance.y + border_instance.down + 5, bone, 0, 1, 0, 0, fight_network_mode);
		x_position += 8;
	}
	
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	create_bone(border_instance.x - 20, border_instance.y - border_instance.up - 6, bone, 1, 1, 270, 0, fight_network_mode);
	create_bone(border_instance.x - 20 + border_instance.right / 3, border_instance.y + border_instance.down + 6, bone, 1, 1, 90, 0, fight_network_mode);
	create_bone(border_instance.x - 20 + border_instance.right * 2 / 3, border_instance.y - border_instance.up - 6, bone, 1, 1, 270, 0, fight_network_mode);
}

var period = 60 - _power * 2;
time_source_update = time_source_create(time_source_game, period / 60, time_source_units_seconds, function () {
	update();
}, [], -1);

var final_time = 6 + 2 * _power;
time_source_update_destroy = time_source_create(time_source_game, final_time, time_source_units_seconds, function () {
	instance_destroy();
});