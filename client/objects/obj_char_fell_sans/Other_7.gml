event_inherited();

if (sprite_index == spr_fell_sans_attack_2_left_down or
	sprite_index == spr_fell_sans_attack_2_right_down or
	sprite_index == spr_fell_sans_attack_2_up_down) {
	sprite_index = spr_fell_sans_attack_2_down;
}

if (sprite_index == spr_fell_sans_attack_2_left_up or
	sprite_index == spr_fell_sans_attack_2_right_up or
	sprite_index == spr_fell_sans_attack_2_down_up) {
	sprite_index = spr_fell_sans_attack_2_up;
}

if (sprite_index == spr_fell_sans_attack_2_up_left or
	sprite_index == spr_fell_sans_attack_2_right_left or
	sprite_index == spr_fell_sans_attack_2_down_left) {
	sprite_index = spr_fell_sans_attack_2_left;
}

if (sprite_index == spr_fell_sans_attack_2_up_right or
	sprite_index == spr_fell_sans_attack_2_left_right or
	sprite_index == spr_fell_sans_attack_2_down_right) {
	sprite_index = spr_fell_sans_attack_2_right;
}