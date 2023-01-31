/// @param key
/// @param any
function soundtrack_get_count(key = "all", value = "any")	{
	var list = soundtrack_list;
	var size = array_length(list);
	
	if (key == "all") {
		return size;
	}
	
	var count = 0;
	for (var i = 0; i < size; i++) {
		var _sound = list[i];
		if (_sound[$ key] == value) {
			count++;
		}
	}
	
	return count;
}