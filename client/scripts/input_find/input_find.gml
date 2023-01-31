/// @param {Real} target
/// @return {Struct.InputKeyClass}
function input_find(target) {
	if (!variable_global_exists("__inputs")) {
		global.__inputs = {};
	}
	
	var key = global.__inputs[$ target];
	return key;
}
