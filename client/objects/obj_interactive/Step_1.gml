if (place_meeting(x, y, target_character) &&
	target_character.is_controlled &&
	input_check_pressed(input.action) &&
	array_any(sides, function(side) { return side == target_character.direction; })) {
	interact_callback();
}