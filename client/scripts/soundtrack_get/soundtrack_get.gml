/// @param key
/// @param {Any} key
/// @param {Any} value
/// @param {Asset.GMSound}
function soundtrack_get(key = "id", value = 0, def = snd_megalorchestra) {
	var list = soundtrack_list;
	
	if (key == "id") {
		if (value < 0 || value >= array_length(list) || value == undefined) {
			return undefined;
		}
		
		return soundtrack_list[value];
	}
	
	var size = array_length(list);
	if (key == "name") {
		for (var i = 0; i < size; i++) {
			var snd = list[i];
			
			var name = snd[$ "name"];
			if (string(value) != name) continue;
			
			return snd;
		}
		
		logger.warning("Soundtrack by 'name' not found! name: [" + string(value) + "] default value: " + audio_get_name(def));
		return def;
	}
	
	if (key == "soundtrack") {
		for (var i = 0; i < size; i++) {
			var snd = list[i];
			var name = snd[$ "soundtrack"];
			if (string(value) != name) continue;
			
			return snd;
		}
		
		logger.warning("Soundtrack by 'soundtrack' not found! name: [" + string(value) + "] default value: " + audio_get_name(def));
		return def;
	}
}