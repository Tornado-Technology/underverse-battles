/// @description Movement
event_inherited();

if (sprite_index == spr_ink_sans_right_calm && moving) {
	sprite_index = spr_ink_sans_walking_right_calm;
}

if (sprite_index == spr_ink_sans_walking_right_calm && !moving) {
	sprite_index = spr_ink_sans_right_calm;
}