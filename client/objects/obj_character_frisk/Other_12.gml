/// @description Movement
event_inherited();

if (is_controlled || is_following) exit;

change_sprite_by_condition(is_moving && sprite_index == standing_down_animation, walking_down_animation);
change_sprite_by_condition(!is_moving && sprite_index == walking_down_animation, standing_down_animation);
change_sprite_by_condition(is_moving && sprite_index == standing_up_animation, walking_up_animation);
change_sprite_by_condition(!is_moving && sprite_index == walking_up_animation, standing_up_animation);
change_sprite_by_condition(is_moving && sprite_index == standing_left_animation, walking_left_animation);
change_sprite_by_condition(!is_moving && sprite_index == walking_left_animation, standing_left_animation);
change_sprite_by_condition(is_moving && sprite_index == standing_right_animation, walking_right_animation);
change_sprite_by_condition(!is_moving && sprite_index == walking_right_animation, standing_right_animation);