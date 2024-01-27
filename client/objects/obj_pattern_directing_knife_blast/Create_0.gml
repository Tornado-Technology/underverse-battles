// Arguments: knife_blast
		
callback = function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red, fight_network_mode);
		
	update();
	time_source_start(time_source_update);
	time_source_start(time_source_update_destroy);
}

update = function() {
	var coord = rand_side_from(border_instance.x - border_instance.left - 60, border_instance.y - border_instance.up - 40, border_instance.x + border_instance.right + 60, border_instance.y + border_instance.down + 40);
	create_battle_object(coord[0], coord[1], 0, knife_blast, {}, fight_network_mode);
}

time_source_update = time_source_create(time_source_game, (26 - _power * 2) / 60, time_source_units_seconds, function () {
	update();
}, [], -1);
time_source_update_destroy = time_source_create(time_source_game, (280 + _power * 30) / 60, time_source_units_seconds, function () {
	instance_destroy();
});