/// @param {Real} target
/// @param {Any} keys
/// @param {Bool} rebinding
function input_bind_default(target, keys, rebinding = true) {
	if (!is_array(keys)) {
		keys = [keys];
	}
	
	for (var i = 0; i <	array_length(keys); i++) {
		var key = keys[i].value;
		keys[i].value = is_string(key) ? ord(key) : key;
	}
	
	var input_key = input_find(target);
	if (input_key == undefined) {
		InputKey(target, keys, rebinding);
		return;
	}
	
	for (var i = 0; i <	array_length(keys); i++) {
		var key = keys[i];
		input_key.add_key(key);
	}
}
