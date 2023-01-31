function has_key_inputs(key) {
	if (!variable_global_exists("__inputs")) {
		global.__inputs = {};
		return false;
	}
	
	var keys = variable_struct_get_names(global.__inputs);
	
	for (var i = 0; i < array_length(keys); i++) {
		var founded_key = global.__inputs[$ keys[i]].working_key;
		
		if (founded_key == undefined) continue;
		if (founded_key.value == key.value && founded_key.device.type == key.device.type) return true;
	}
	
	return false;
}