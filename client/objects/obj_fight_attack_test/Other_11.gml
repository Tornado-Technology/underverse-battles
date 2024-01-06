/// @description Instance create
instance_create_struct(required_components);

// Set camera
camera_set_position(0, 0);

// Players
for (var player_id = 0; player_id < player_ammount; player_id++) {
	player[player_id] = instance_create_depth(center_player_position_x[player_id], center_player_position_y[player_id], fight_depth.player, player_object[player_id]);
	player[player_id].player_num = player_id;
}
player[0].mana = player[0].max_mana;
player[0].special_action.percent = 100;

fight_flip_player(1);

// Time source
end_battle_timesource = time_source_create(time_source_game, 1.5, time_source_units_seconds, goto_ending_room);

// Statiscics
instance_create_one(obj_statistics);