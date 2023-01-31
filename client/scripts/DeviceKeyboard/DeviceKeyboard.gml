function DeviceKeyboard() {
	return new ClassDeviceKeyboard();
}


function ClassDeviceKeyboard() constructor {
	type = device.keyboard;
	
	static check_pressed = function(button) {
		return keyboard_check_pressed(button);
	}
	
	static check_held = function(button) {
		return keyboard_check(button);
	}
	
	static check_released = function(button) {
		return keyboard_check_released(button);
	}
}
