/// @param {Real} target
/// @param {Array<Real>} keys
/// @param {Bool} rebinding
function InputKey(target, keys, rebinding = true, data_key = undefined) {
	if (!variable_global_exists("__inputs")) {
		global.__inputs = {};
	}
	
	var input_key = new InputKeyClass(target, keys, rebinding, data_key);
	global.__inputs[$ target] = input_key;
	
	return input_key;
}

/// @param {Real} target
/// @param {Array<Real>} keys
/// @param {Bool} rebinding
function InputKeyClass(target, keys, rebinding, data_key) constructor {
	self.target = target;
	self.defaultKeys = keys;
	self.rebinding = rebinding;
	self.data_key = data_key;
	working_key = undefined;

	/// @param {Function} callabck
	/// @return {Bool}
	static __check__ = function(callback) {
		if (working_key != undefined) {
			if (callback(working_key)) return true;
		}
		
		for (var i = 0; i < array_length(defaultKeys); i++) {
			if (callback(defaultKeys[i])) {
				return true;
			}
		}
		
		return false;
	}
	
	/// @return {Bool}
	static check_pressed = function() {
		return __check__(function(key) {
			return key.device.check_pressed(key.value);
		});
	}
	
	/// @return {Bool}
	static check_held = function() {
		return __check__(function(key) {
			return key.device.check_held(key.value);
		});
	}
	
	/// @return {Bool}
	static check_released = function() {
		return __check__(function(key) {
			return key.device.check_released(key.value);
		});
	}
	
	/// @param {struct.Key} key
	static has_key = function(key) {
		return array_find_index(defaultKeys, function(founded_key, i) {
			return key.value == founded_key.value && key.device_type == founded_key.device_type;
		}) != undefined
	}
	
	/// @param {struct.Key} key
	static key_index = function(key) {
		return array_find_index(defaultKeys, function(founded_key, i) {
			return key.value == founded_key.value && key.device_type == founded_key.device_type;
		});
	}
	
	/// @param {struct.Key} key
	static add_default_key = function(key) {
		if (!rebinding) return;
		
		if (has_key(key)) {
			logger.warn("InputKey add \"{0}\"key failed, reasone: Already in the keys.");
			return;
		}
		
		array_push(defaultKeys, key);
	}
	
	/// @param {struct.Key} key
	static remove_default_key = function(key) {
		if (!rebinding) return;
		
		if (!has_key(key)) {
			logger.warn("InputKey remove \"{0}\"key failed, reasone: Not found in the keys.");
			return;
		}

		array_delete(defaultKeys, key_index(key), 1);
	}
		
	static clear_default_keys = function() {
		array_clear(defaultKeys);
	}
	
	static clear_key = function() {
		working_key = undefined;
		
		if (data_key == undefined) return;
		data_set(data_key, undefined);
	}
	
	/// @param {struct.Key} key
	static set_key = function(key) {
		working_key = key;
		
		if (data_key == undefined) return;
		data_set(data_key, key.value);
	}
}
