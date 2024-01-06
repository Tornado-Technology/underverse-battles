function controller_get() {
	var controls = global.__ui_controls_instance;
	if (controls == noone) return;
	
	return controls.get_controller();
}