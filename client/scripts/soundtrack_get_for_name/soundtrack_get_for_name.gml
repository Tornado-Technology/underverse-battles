///@arg name
function soundtrack_get_for_name() {
	var _soundtrack = string(argument[0]);
	var _size = soundtrack_get_count();
	
	var _id = 0;
	repeat(_size) {
		
		var _sound_name = soundtrack_get(SOUNDTRACK_INFO.SOUNDRTACK, _id);
		if (_soundtrack == _sound_name)
			return soundtrack_get(SOUNDTRACK_INFO.NAME, _id);

		_id++;
	}	
	
	return "";
}