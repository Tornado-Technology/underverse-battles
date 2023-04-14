/// @description Bone veil
if (started) exit;

_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
if (battle_border_start_animation_end()) exit;
		
_soul = create_soul(_border.x, _border.y, battle_soul_type.orange);

update_3_0();
update_3_1();
time_source_start(time_source_update_3_0);
time_source_start(time_source_update_3_1);
time_source_start(time_source_update_stop_3_0);
	
started = true;