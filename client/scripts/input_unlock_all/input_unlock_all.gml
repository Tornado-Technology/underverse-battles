function input_unlock_all() {
	if (!variable_global_exists("__inputs")) {
		global.__inputs = {};
		return false;
	}
	
	var keys = variable_struct_get_names(global.__inputs);
	
	for (var i = 0; i < array_length(keys); i++) {
		global.__inputs[$ keys[i]].is_locked = false;
	}
}