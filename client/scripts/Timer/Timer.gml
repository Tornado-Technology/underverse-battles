/// @param {number} delay
/// @param {method} method
function Timer(_delay, _method) {
	return new __class_timer(_delay, _method);
}

/// @param {number} delay
/// @param {method} method
function __class_timer(_delay, _method) constructor {
	pause = false;
	time_delay = _delay;
	time = _delay;
	callback = _method;
	
	static reset = function() {
		time = time_delay;
	}
	
	static stop = function(_reset = false) {
		pause = true;	
		if (_reset) reset();
	}
	
	static start = function(_reset = false) {
		pause = false;
		if (_reset) reset();
	}
	
	static update = function() {
		if (pause) return;	
	
		time--;
		
		if (time == 0) {
			reset();
			callback();
		}
	}
}

