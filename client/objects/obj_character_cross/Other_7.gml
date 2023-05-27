event_inherited();

if (sprite_index == hand_left_down_animation ||
	sprite_index == hand_right_down_animation ||
	sprite_index == hand_up_down_animation) {
	sprite_index = hand_down_animation;
}

if (sprite_index == hand_left_up_animation ||
	sprite_index == hand_right_up_animation ||
	sprite_index == hand_down_up_animation) {
	sprite_index = hand_up_animation;
}

if (sprite_index == hand_up_left_animation ||
	sprite_index == hand_right_left_animation ||
	sprite_index == hand_down_left_animation) {
	sprite_index = hand_left_animation;
}

if (sprite_index == hand_up_right_animation ||
	sprite_index == hand_left_right_animation ||
	sprite_index == hand_down_right_animation) {
	sprite_index = hand_right_animation;
}
	
event_user(3);