/// @description Movement
event_inherited();

if (is_controlled || is_following) exit;

change_sprite_by_condition(is_moving && sprite_index == spr_ink_sans_right_calm, spr_ink_sans_walking_right_calm);
change_sprite_by_condition(!is_moving && sprite_index == spr_ink_sans_walking_right_calm, spr_ink_sans_right_calm);