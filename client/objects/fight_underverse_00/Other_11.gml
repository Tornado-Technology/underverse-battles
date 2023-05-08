/// @description Instance create

// Create fights components
instance_create_struct(required_components);

//Starting value for Underverse 0.0 obj_fight
fight_set_player_input(false);
fight_ui_set_player_can_input_skip(false);
fight_set_ui_showing_action_box(false);
fight_set_showing_action_box_power(false);
fight_set_showing_special_action(false);
timer_switch(false);

// Create players
player[0] = player_object[0];
player[1] = player_object[1];

// Time source
end_battle_timesource = time_source_create(time_source_game, 1.5, time_source_units_seconds, goto_ending_room);