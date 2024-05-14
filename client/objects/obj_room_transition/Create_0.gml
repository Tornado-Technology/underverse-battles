target_character = obj_character_frisk;

new_room = undefined;
transition_time = 0.4;
required_pressing = false;

transition = function() {
	target_character.set_uncontrolled();
	
	effect_fade(transition_time, 0, transition_time, c_black, true, fight_depth.ui);
	time_source_start(time_source_transition);
	
	transition_callback();
}

transition_callback = function() {}

time_source_transition = time_source_create(time_source_game, transition_time, time_source_units_seconds, function () {
	if (variable_instance_exists(id, "new_room")) {
		room_goto(new_room);
	}
});