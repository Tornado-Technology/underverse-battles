/// @param {Struct<Id.Instance>} instances
/// @param {Bool} execute_event_flag
function instance_destroy_struct(instances, execute_event_flag = true) {
	var elements = variable_struct_get_names(instances);
	for (var i = 0; i < array_length(elements); i++) {
		instance_destroy(instances[$ elements[i]], execute_event_flag);
	}
}

