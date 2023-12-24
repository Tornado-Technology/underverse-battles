/// @param {String} key - The address in the save file is written with a symbol - "."
/// @param {Bool} recursively - Attempting to retrieve information after a read error. It is not always possible to set this parameter to "true" because of problems with infinite loops in system locations and boot areas
function data_get(key = "", recursively = true) {
	if (global.__data_save == undefined) {
		logger.warning($"Trying to get information \"{key}\" from a file before it is initialized!");
		return;
	}
	
	// If we don't specify a key, we just return the object
	// This is old code, DAMN IT DO NOT USE IT
	if (key = "") {
		logger.warning("Using this method is extremely unsafe! If you see that you used \"data_get()\" without a key argument somewhere, search for it and fix the problem!");
		return global.__data_save;
	}
	
	// Gradually we get the date
	var path = undefined;
	var new_path = undefined;
	
	try {	
		var keys = string_split(key, ".");
		path = global.__data_save[$ keys[0]];
		new_path = -1;
		
		for (var i = 1; i < array_length(keys); i++) {
			new_path = path[$ keys[i]];
			path = new_path;
		}
	} catch (error) {
		logger.warning($"Error with reading data: {error.message}.");
		data_reset(false);
		data_load();
		
		try {
			if (recursively) {
				return data_get(key, false);
			}
		} catch (error) {
			logger.error($"FATAL Error with reading data: {error.message}.");
		}
	}
	
	return path;
}