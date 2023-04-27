/// @description Instance create

// Create fights components
instance_create_struct(required_components);

//show_message(instance_exists(obj_fight_input));

//Starting value for fight
fight_set_showing_special_action(false);

// Create players
player[0] = player_object[0];
player[1] = player_object[1];