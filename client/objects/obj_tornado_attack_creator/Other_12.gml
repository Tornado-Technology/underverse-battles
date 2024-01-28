// Create border
border_instance = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);

time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
	soul_instance = create_soul(border_instance.x, border_instance.y, battle_soul_type.red);
	instance_destroy();
});
time_source_start(time_source_border_delay);