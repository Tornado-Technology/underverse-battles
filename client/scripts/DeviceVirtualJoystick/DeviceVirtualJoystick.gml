function DeviceVirtualJoystick() {
	return new ClassDeviceVirtualJoystick();
}


function ClassDeviceVirtualJoystick() constructor {
	type = device.virtual_joystick;
	
	static check_pressed = function(button) {
		return input_joystick_check_pressed(button);
	}
	
	static check_held = function(button) {
		return input_joystick_check(button);
	}
	
	static check_released = function(button) {
		return false;
	}
}
