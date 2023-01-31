function input_reset_all_working_key(){
	if (!variable_global_exists("__inputs")) {
		global.__inputs = {};
		return false;
	}
	
	var keys = variable_struct_get_names(global.__inputs);
	
	for (var i = 0; i < array_length(keys); i++) {
		global.__inputs[$ keys[i]].clear_key();
	}
}