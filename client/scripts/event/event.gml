/// @desc Base class for create Events like C# delegate.
function Event() constructor {
	listeners = [];
	
	/// @param {Function} callback - A subscriber called by the invoke() method can be unsubscribed with disconnect()
	static connect = function(callback) {
		array_push(listeners, callback)
		return callback;
	}
	
	/// @desc Returns: Operation report, erased - true, in other cases - false.
	/// @param {Function} callback - Subscriber you want to unsubscribe
	/// @return {Bool} - Operation report, erased - true, in other cases - false
	static disconnect = function(callback) {
		for (var i = 0; i < array_length(listeners); i++) {
			var element = listeners[i];
			
			if (callback == element) {
				array_delete(listeners, i, 1);
				return true;
			}
		}
		
		return false;
	}
	
	/// @desc Calls all subscribers with the specified arguments packed array
	/// @param {Any} ... - Arguments for callback
	static invoke = function() {
		var array_arguments = [];
		for (var i = 0; i < argument_count; i++) {
			array_push(array_arguments, argument[i]);
		}
		
		for (var i = 0; i < array_length(listeners); i++) {
			var listener_method = listeners[i];
			
			try {
				listener_method(array_arguments);
			} catch(_error) {
				logger.fatal("Event: Listener method call error: {0}.", _error.message);
			}
		}
	}
}
