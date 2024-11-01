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
	self.default_keys = keys;
	self.rebinding = rebinding;
	self.data_key = data_key;
	is_locked = false;
	working_key = undefined;

	/// @param {Function} callabck
	/// @return {Bool}
	static __check__ = function(callback) {
		if (working_key != undefined) {
			if (callback(working_key)) return true;
		}
		
		for (var i = 0; i < array_length(default_keys); i++) {
			if (callback(default_keys[i])) {
				return true;
			}
		}
		
		return false;
	}
	
	static __check___moving_joystick = function(callback) {
		if (working_key != undefined) {
			if (callback(working_key)) return true;
		}
		
		for (var i = 0; i < array_length(default_keys); i++) {
			if (callback(default_keys[i]) != 0) {
				return callback(default_keys[i]);
			}
		}
		
		return false;
	}
	
	
	/// @return {Bool}
	static check_pressed = function() {
		if (is_locked) return false;
		
		return __check__(function(key) {
			return key.device.check_pressed(key.value);
		});
	}
	
	/// @return {Bool}
	static check_held = function() {
		if (is_locked) return false;
		
		return __check__(function(key) {
			return key.device.check_held(key.value);
		});
	}
	
	/// @return {Bool}
	static check_released = function() {
		if (is_locked) return false;
		
		return __check__(function(key) {
			return key.device.check_released(key.value);
		});
	}
	
	static moving_joystick = function () {
			if (is_locked) return false;
		
		return __check___moving_joystick(function(key) {
			return key.device.moving_joystick(key.value);
		});
		
	}
	
	
	/// @param {struct.Key} key
	static has_key = function(key) {
		checking_key = key;
		return method(self, array_find_index(default_keys, function(founded_key, i) {
			return checking_key.value == founded_key.value && checking_key.device_type == founded_key.device_type;
		})) != -1;
	}
	
	/// @param {struct.Key} key
	static key_index = function(key) {
		checking_key = key;
		return method(self, array_find_index(default_keys, function(founded_key, i) {
			return checking_key.value == founded_key.value && checking_key.device_type == founded_key.device_type;
		}));
	}
	
	/// @param {struct.Key} key
	static add_default_key = function(key) {
		if (!rebinding) return;
		
		if (has_key(key)) {
			logger.warning($"InputKey add \"{key}\"key failed, reasone: Already in the keys.");
			return;
		}
		
		array_push(default_keys, key);
	}
	
	/// @param {struct.Key} key
	static remove_default_key = function(key) {
		if (!rebinding) return;
		
		if (!has_key(key)) {
			logger.warning($"InputKey remove \"{key}\"key failed, reasone: Not found in the keys.");
			return;
		}

		array_delete(default_keys, key_index(key), 1);
	}
		
	static clear_default_keys = function() {
		array_clear(default_keys);
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
