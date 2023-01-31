/// @param {Real} target
/// @param {struct.Key} key
function input_bind(target, key, data_key = undefined) {
	var input_key = input_find(target);
	if (input_key == undefined) return;
	
	key.value = is_string(key.value) ? ord(key.value) : key.value;
	input_key.data_key = data_key = undefined ? input_key.data_key : data_key;
	input_key.set_key(key);
	
	return input_key;
}
