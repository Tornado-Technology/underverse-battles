function DeviceMouse() {
	return new ClassDeviceMouse();
}


function ClassDeviceMouse() constructor {
	type = device.mouse;
	
	static check_pressed = function(button) {
		return mouse_check_button_pressed(button)
	}
	
	static check_held = function(button) {
		return mouse_check_button(button)
	}
	
	static check_released = function(button) {
		return mouse_check_button_released(button)
	}
}
