/// @desc Bad time

var  border_decrease = 20;
_border = battle_border_create(battle_border.up - border_decrease, battle_border.down - border_decrease, battle_border.left - border_decrease, battle_border.right - border_decrease);
	
time_source_border_delay = time_source_create(time_source_game, time_border_delay, time_source_units_seconds, function () {
	_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);
	_soul.changeable_direction = true;
	
	num = 12;
	
	bone_size_update_0_0 = 5.4;
	bone_scale = 3;
	if (attack_num == 1) bone_scale = 4.4;
	
	if (attack_num == 0) {
		update_2_0();
	}
	else {
		update_2_1(3);
	}
	time_source_start(time_source_update_3_0);
	time_source_start(time_source_update_3_1);
	time_source_start(time_source_update_destroy_3_2);
});
time_source_start(time_source_border_delay);