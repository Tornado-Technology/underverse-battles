if (room == room_underverse_episode_3_part_1)  {
	is_enable_run_button = true;
		foreach_buttons = function(delegate) {
		var elements = variable_struct_get_names(buttons);
		for (var i = 0; i < array_length(elements); i++) {
			if (!is_enable_run_button && elements[i] == "X") continue;
			if (!instance_exists(obj_inventory) && elements[i] == "SpecialAction") continue;
			delegate(buttons[$ elements[i]]);
		}
	}
} else {
	foreach_buttons = function(delegate) {
	var elements = variable_struct_get_names(buttons);
		for (var i = 0; i < array_length(elements); i++) {
			delegate(buttons[$ elements[i]]);
		}
	}	
	
}