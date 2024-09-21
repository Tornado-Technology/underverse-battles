function DeviceGamepad() {
	return new ClassDeviceGamepad();
}


function ClassDeviceGamepad() constructor {
	type = device.gamepad;
	self.device = 0;
	
	static check_pressed = function(button) {
		return gamepad_button_check_pressed(device, button)
	}
	
	static check_held = function(button) {
		return gamepad_button_check(device, button)
	}
	
	static check_released = function(button) {
		return gamepad_button_check_released(device, button)
	}
	
	static moving_joystick = function (button) {
		
		return gamepad_axis_value(device, button)
	}
	
}
