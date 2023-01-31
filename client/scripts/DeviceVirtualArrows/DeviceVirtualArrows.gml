function DeviceVirtualArrows() {
	return new ClassDeviceVirtualArrows();
}


function ClassDeviceVirtualArrows() constructor {
	type = device.virtual_arrows;
	
	static check_pressed = function(button) {
		return input_arrows_check_button_is_pressed(button);
	}
	
	static check_held = function(button) {
		return input_arrows_check_button_is_held(button);
	}
	
	static check_released = function(button) {
		return false;
	}
}
