/// @param {string} key
/// @param {any} value
function data_set(_key, _value){
    var data = global.__data_save;
    
	if (data == undefined) {
		logger.warning("SaveData set failed, reasone: not load yet, key \"{0}\" value \"{1}\".", _key. _value);
		return;
	}
	
    var keys = string_split(_key, ".");
    var path = data[$ keys[0]];
    var key = keys[array_length(keys) - 1];
    
    try {
        for (var i = 1; i < array_length(keys) - 1; i++) {
            path = path[$ keys[i]];
        }
        
        if (!variable_struct_exists(path, key)) {
            logger.warning("SaveData read failed, reasone: key \"{0}\" not found.", _key);
            return;
        }
        
        path[$ key] = _value;
		on_data_updated.invoke(_key, _value);
		
		if (is_mobile) data_save();
        
    } catch(_error) {
        logger.warning("SaveData read failed, reasone: {0}.", _error.message);
        return;    
    }
}
