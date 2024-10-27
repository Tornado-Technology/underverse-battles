function fight_action_box_animation_was_finish() {
	with (obj_fight_ui) {
		if (action_box_position.y <= action_box_position_start.y + 1)
			return true;
	}
	return false;
}