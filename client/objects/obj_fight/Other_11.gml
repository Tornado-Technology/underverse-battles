/// @description Instance create
instance_create_struct(required_components);

// Set camera
camera_set_position(0, 0);

// Players
for (var player_id = 0; player_id < player_ammount; player_id++) {
	player[player_id] = instance_create_depth(center_player_position_x[player_id], center_player_position_y[player_id], fight_depth.player, player_object[player_id]);
	player[player_id].player_num = player_id;
	
	// Offseting players
	fight_move_player_position_x(player_id, fight_get_player_offset_x(player_id));
	fight_move_player_position_y(player_id, fight_get_player_offset_y(player_id));
}

fight_flip_player(1);

// Time source
end_battle_timesource = time_source_create(time_source_game, 1.5, time_source_units_seconds, goto_ending_room);

// Statiscics
instance_create_one(obj_statistics);

// Start timer
timer_start();

on_into_fight.invoke(player[_opponent].name);