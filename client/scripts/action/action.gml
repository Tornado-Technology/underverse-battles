/// @param {String} key
/// @param {Function} callback
/// @return {Struct.ActionClass}
function Action(key, callback = undefined) {
	var action = new ActionClass(key + ".Name", key + ".Description", callback);
	action.init();
	return action;
}

/// @param {String} key_name
/// @param {String} key_description
/// @param {Function} callback
function ActionClass(key_name, key_description, callback) constructor {
	self.key_name = key_name;
	self.key_description = key_description;
	self.callback = callback;
	
	name = "";
	description = "";
	
	static init = function() {
		name = translate_get(key_name);
		description = translate_get(key_description);
	}
	
	/// @param {Id.Instance} character
	/// @param {Real} power
	static invoke = function(character, pow) {
		if (callback == undefined) return;
		callback(pow, character);
	}
}
