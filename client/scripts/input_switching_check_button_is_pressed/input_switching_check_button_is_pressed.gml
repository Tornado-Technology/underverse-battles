function input_switching_check_button_is_pressed(key){
var controls = global.__ui_controls_instance;
	if (controls == noone) return false;
	
	if (controls.controls_switching == undefined) return false;
	
	return  controls.controls_switching.input_pressed == key 
}