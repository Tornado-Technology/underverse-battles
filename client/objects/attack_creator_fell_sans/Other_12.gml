/// @desc Blue attack
if (started) exit;

_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
if (battle_border_start_animation_end()) exit;
	
if (attack_num = 0)
	_soul = create_soul(_border.x, _border.y, battle_soul_type.blue);
else
	_soul = create_soul(_border.x, _border.y, battle_soul_type.red);

update_2_0(_power);
time_source_start(time_source_update_2_0);
time_source_start(time_source_update_destroy_2_0);

started = true;