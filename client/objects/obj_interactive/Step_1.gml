if (!instance_exists(obj_dialog) &&
	place_meeting(x, y, target_character) &&
	target_character.is_controlled &&
	(!required_pressing || required_pressing && input_check_pressed(input.action)) &&
	array_any(sides, function(side) { return side == target_character.direction; })) {
	interact_callback();
}