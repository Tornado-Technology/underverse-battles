/// @description Movement
event_inherited();

if (sprite_index == spr_error_sans_right_strings && is_moving) {
	sprite_index = spr_error_sans_right_strings_walking;
}

if (sprite_index == spr_error_sans_right_strings_walking && !is_moving) {
	sprite_index = spr_error_sans_right_strings;
}