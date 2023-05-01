/// @description Crusader
if (started) exit;

_border = battle_border_create(battle_border.up - 20, battle_border.down - 20, battle_border.left - 20, battle_border.right - 20);
if (battle_border_start_animation_end()) exit;

_soul = create_soul(_border.x, _border.y, battle_soul_type.red);

rot = irandom_range(0, 1);

time_source_start(time_source_update_3_0);
time_source_start(time_source_update_3_1);
time_source_start(time_source_update_stop_3_1);

started = true;