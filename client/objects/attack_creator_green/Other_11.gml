/// @description Strings
if (started) exit;

_border = battle_border_create(battle_border.up, battle_border.down, battle_border.left, battle_border.right);
if (battle_border_start_animation_end()) exit;

_soul = create_soul(obj_battle_border.x, obj_battle_border.y, battle_soul_type.red);

update_1_0_2(_power);
time_source_start(time_source_update_1_0);
time_source_start(time_source_update_1_0_2);
time_source_start(time_source_update_destroy_1_0);

started = true;