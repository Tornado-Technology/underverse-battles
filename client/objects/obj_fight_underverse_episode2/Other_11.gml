/// @description Instance create

// Create fights components
instance_create_struct(required_components);

//Starting value for fight
fight_set_showing_special_action(false);

// Create players
player[0] = player_object[0];
player[1] = player_object[1];

// Start timer
timer_start();