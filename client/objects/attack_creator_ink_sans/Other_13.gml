/// @desc Ink blast
_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);

time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
	var soul_random_position = new Vector2(choose(_border.x - _border.left/2, _border.x + _border.right/2), choose(_border.y - _border.up/2, _border.y + _border.down/2));
	_soul = create_soul(soul_random_position.x, soul_random_position.y, battle_soul_type.red);

	instance_create_depth(_border.x, _border.y, fight_depth.bullet_outside_hight, obj_ink_ball_ink_sans);

	time_source_start(time_source_update_3_0);
	time_source_start(time_source_update_3_1);
	time_source_start(time_source_update_destroy_3_0);
});
time_source_start(time_source_border_delay);