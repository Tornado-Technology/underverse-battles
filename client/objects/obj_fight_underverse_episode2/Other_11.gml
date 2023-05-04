/// @description Instance create

// Create fights components
instance_create_struct(required_components);

//Starting value for fight
fight_set_showing_special_action(false);

// Create players
player[0] = player_object[0];
player[1] = player_object[1];

// Time source
end_battle_timesource = time_source_create(time_source_game, 1.5, time_source_units_seconds, goto_ending_room);

// Start timer
timer_start();