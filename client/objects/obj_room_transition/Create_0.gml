target_character = obj_character_frisk;

new_room = undefined;
transition_time = 1;

transition = function() {
	target_character.set_uncontrolled();
	
	effect_fade(transition_time, 0, 0, c_black, true, fight_depth.ui);
}

time_source_transition = time_source_create(time_source_game, transition_time, time_source_units_seconds, function () {
	if (variable_instance_exists(id, "new_room")) {
		room_goto(new_room);
	}
});