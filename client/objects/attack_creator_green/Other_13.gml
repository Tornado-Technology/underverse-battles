/// @description Edit

_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);

time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
	edit_button = instance_create(obj_edit_button_green);

	_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red, fight_network_mode);

	update_3_0();
	time_source_start(time_source_update_3_0);
	time_source_start(time_source_update_stop_3_0);
});
time_source_start(time_source_border_delay);