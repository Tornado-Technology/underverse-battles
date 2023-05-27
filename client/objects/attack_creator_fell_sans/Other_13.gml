/// @desc Great time
_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);

time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
	_soul = create_soul(_border.x, _border.y, battle_soul_type.red);

	update_0_1(3);
	time_source_start(time_source_update_3_0);
	time_source_start(time_source_update_destroy_3_0);
});
time_source_start(time_source_border_delay);