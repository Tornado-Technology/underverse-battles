if (place_meeting(x, y, target_character) && target_character.is_controlled) {
	if (!required_pressing || (required_pressing && input_check_pressed(input.action))) {
		transition();
	}
}