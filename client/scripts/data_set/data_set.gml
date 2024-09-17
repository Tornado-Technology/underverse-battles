/// @param {string} key
/// @param {any} value
function data_set(_key, _value){
    var data = global.__data_save;
    
	if (data == undefined) {
		logger.warning($"SaveData set failed, reasone: not load yet, key \"{_key}\" value \"{_value}\".");
		return;
	}
	
    var keys = string_split(_key, ".");
	
	if (!variable_struct_exists(data, keys[0])) {
		struct_set(data, keys[0], {});
	}
	
    var path = data[$ keys[0]];
    var key = keys[array_length(keys) - 1];
    
    try {
        for (var i = 1; i < array_length(keys) - 1; i++) {
            path = path[$ keys[i]];
        }
        
        struct_set(path, key, _value);
		on_data_updated.invoke(_key, _value);
		
		if (is_mobile) data_save();
        
    } catch(_error) {
        logger.warning($"SaveData read failed, reasone: {_error.message}.");
        return;    
    }
}
