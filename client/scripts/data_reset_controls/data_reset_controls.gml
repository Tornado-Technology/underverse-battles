function data_reset_controls() {
	if (!variable_global_exists("__inputs")) {
		global.__inputs = {};
		return false;
	}
	
	var keys = variable_struct_get_names(global.__inputs);
	var data_template = json_open(DATA_TEMPLATE_PATH);
	
	for (var i = 0; i < array_length(keys); i++) {
		var _input = global.__inputs[$ keys[i]];
		
		if (_input.data_key == undefined) continue;
		var value = struct_get_key_value(data_template, _input.data_key, undefined);
		
		_input.set_key(Key(device.keyboard, value));
	}
}