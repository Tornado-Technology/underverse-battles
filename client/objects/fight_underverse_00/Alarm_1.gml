/// @desc Create enemies

// Create fights components
instance_create_array(required_components);

//Starting value for Underverse 0.0 obj_fight
fight_set_player_input(false);
fight_ui_set_player_can_input_skip(false);
fight_set_ui_showing_action_box(false);
fight_set_ui_showing_action_box_power(false);
timer_switched_off();

// Create enemys
enemy[0] = enemy_object[0];
enemy[1] = enemy_object[1];

// Offseting enemys
for (var _id = 0; _id < 2; _id++) {
	fight_move_enemy_position_x(_id, fight_get_enemy_offset_x(_id));
	fight_move_enemy_position_y(_id, fight_get_enemy_offset_y(_id));
}

// Fliping enemy
fight_flip_enemy(1);
