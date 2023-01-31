

function Key(device_type, value) {
	var instance = new ClassKey(device_type, value);
	instance.init();
	
	return instance;
}

function ClassKey(device_type, value) constructor {
	self.device_type = device_type;
	self.value = value;
	
	static init = function() {
		switch(device_type) {
			case device.mouse:
				self.device = DeviceMouse();
				break;
			case device.keyboard:
				self.device = DeviceKeyboard();
				break;
			case device.gamepad:
				self.device = DeviceGamepad();
				break;
			case device.virtual_arrows:
				self.device = DeviceVirtualArrows();
				break;
			case device.virtual_joystick:
				self.device = DeviceVirtualJoystick();
				break;
		}
	}
}
