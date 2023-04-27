/// @description Movement
event_inherited();

if (sprite_index == spr_error_sans_right_strings && moving) {
	sprite_index = spr_error_sans_right_strings_walking;
}

if (sprite_index == spr_error_sans_right_strings_walking && !moving) {
	sprite_index = spr_error_sans_right_strings;
}