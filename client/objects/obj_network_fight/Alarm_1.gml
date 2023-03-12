/// @desc Create enemies

// Create fights components
instance_create_struct(required_components);

// Create players
player[0] = instance_create_depth(center_player_position_x[0], center_player_position_y[0], fight_depth.player, player_object[0]);
player[1] = instance_create_depth(center_player_position_x[1], center_player_position_y[1], fight_depth.player, player_object[1]);

// Statistics
instance_create(obj_statistics);

// Offseting players
for (var player_id = 0; player_id < 2; player_id++) {
	player[player_id].player_num = player_id;
	fight_move_player_position_x(player_id, fight_get_player_offset_x(player_id));
	fight_move_player_position_y(player_id, fight_get_player_offset_y(player_id));
}

// Fliping player
fight_flip_player(1);
send_fight_joined();
