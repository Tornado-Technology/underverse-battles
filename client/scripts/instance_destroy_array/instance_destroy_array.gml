/// @param {Array<Id.Instance>} instances
/// @param {Bool} execute_event_flag
function instance_destroy_array(instances, execute_event_flag = true) {
	for (var i = 0; i < array_length(instances); i++) {
		instance_destroy(instances[i], execute_event_flag);
	}
}
