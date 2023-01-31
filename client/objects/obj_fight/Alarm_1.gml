/// @desc Create enemies

// Create fights components
instance_create_struct(required_components);

// Create enemys
enemy[0] = instance_create_depth(center_enemy_position_x[0], center_enemy_position_y[0], fight_depth.enemy, enemy_object[0]);
enemy[1] = instance_create_depth(center_enemy_position_x[1], center_enemy_position_y[1], fight_depth.enemy, enemy_object[1]);

enemy[0].player_num = 0;
enemy[1].player_num = 1;

// Statistics
instance_create_one(obj_statistics);

// Offseting enemys
for (var enemy_id = 0; enemy_id < 2; enemy_id++) {
	fight_move_enemy_position_x(enemy_id, fight_get_enemy_offset_x(enemy_id));
	fight_move_enemy_position_y(enemy_id, fight_get_enemy_offset_y(enemy_id));
}

// Fliping enemy
fight_flip_enemy(1);

on_into_fight.invoke(enemy[1].name);
