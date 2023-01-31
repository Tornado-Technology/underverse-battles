function input_get_working_key(target) {
	var _input = input_find(target);
	
	if (_input == undefined) return;
	
	return _input.working_key;
}