function __InputTextBox() {
	var keys = [];
	for (var i = 0; i < argument_count; i++) {
		array_push(keys, argument[i]);
	}
	
	var instance = new __ClassInputTextBox(keys);
	instance.init();
	
	return instance;
}

function __ClassInputTextBox(keys) constructor {
	self.keys = keys;
	keys_count = array_length(keys)
	
	is_holding = false;
	time_until_holdimg = 15;
	is_can_input = true;
	input_delay = 3;
	holding_time_source = undefined;
	is_mouse = false;
	input_time_source = undefined;
	only_holding = false;
	
	pressed = false;
	
	on_input = function() {};
	
	static init = function() {
		holding_time_source = Timer(time_until_holdimg, function() {
			is_holding = true;
		});
		input_time_source = Timer(input_delay, function() {
			is_can_input = true;
		});
	}
	
	static check_holding_keys = function() {	
		if (is_mouse) return false;
		if (!keyboard_check(vk_anykey)) return false;
		
		for (var i = 0; i < array_length(keys); i++) {
			var key = keys[i];
			
			if (typeof(key) == "string") {
				if (!__keyboard_check(ord(key))) return false;
				keyboard_clear(ord(key));
				keyboard_clear_lastkey();
				continue;
			}
			
			if (!__keyboard_check(key)) return false;
			keyboard_clear(key);
			keyboard_clear_lastkey();
		}
		
		return true
	}
	
	static check_pressed_keys = function() {
		if (is_mouse) return false;
		if (!keyboard_check_pressed(vk_anykey)) return false;
		
		for (var i = 0; i < array_length(keys); i++) {
			var key = keys[i];
			
			if (typeof(key) == "string") {
				if (!__keyboard_check_pressed(ord(key))) return false;
				keyboard_clear(ord(key));
				keyboard_clear_lastkey();
				continue;
			}
			
			if (!__keyboard_check_pressed(key)) return false;
			keyboard_clear(key);
			keyboard_clear_lastkey();
		}
		
		return true
	}
	
	static check_mouse_holding_keys = function() {
		if (!is_mouse) return false;
		
		for (var i = 0; i < array_length(keys); i++) {
			var key = keys[i];
			
			if (!mouse_check_button(key)) return false;
		}
		
		return true
	}
	
	static check_mouse_pressed_keys = function() {
		if (!is_mouse) return false;
		
		for (var i = 0; i < array_length(keys); i++) {
			var key = keys[i];
			
			if (!mouse_check_button_pressed(key)) return false;
		}
		
		return true
	}
	
	static update = function() {
		var is_holding_keys = check_holding_keys;
		var is_pressed_keys = check_pressed_keys;
		var is_mouse_pressed = check_mouse_pressed_keys();
		var is_mouse_holding = check_mouse_holding_keys();
		
		if (((keys_count == 0 ? is_pressed_keys : is_holding_keys) || is_mouse_pressed) && !pressed && !only_holding) {
			on_input();
			pressed = true;
			return;
		}
		
		if (!is_holding_keys && !is_mouse_holding) {
			is_holding = false;
			holding_time_source.stop(true);
			pressed = false;
			return;
		};
		
		if (holding_time_source.pause && !is_holding) {			
			holding_time_source.start();
		}
		
		if (is_holding && is_can_input) {
			on_input();
			is_can_input = false;			
			input_time_source.start(true);
		}
		
		if (!input_time_source.pause) {
			input_time_source.update();
		}
		if (!holding_time_source.pause) {
			holding_time_source.update();
		}
	}
}
