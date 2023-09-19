width = display_get_gui_width();
height = display_get_gui_height();

change_element = function(_element) {
	element = _element;
	
	var scale_max = element.scale_max - 1; // 1 - it is scale_min
	var value = (element.scale - 1) / scale_max;
	slider.change_value(value, false);
}



draw_controller = function () {
var controller = global.__ui_controls_instance;
if (controller.controllers_index == control_input_mode.ui_joystick) {	
	joystick = controller.get_controller();

	joystick_sprite_hadler = joystick.handle_image;
	joystick_sprite_border = joystick.border_image;
	
		controls = [
		SettingsMobileJoystick(id, joystick_sprite_border, joystick_sprite_hadler),
	];
};

if (controller.controllers_index == control_input_mode.ui_arrows) {
	arrows = controller.get_controller();	

	controls_arrow = arrows.controls_arrow;

	controls = [ SettingsMobileArrow(id,  controls_arrow) ];
	
};
controllers_switching = controller.controls_switching.controls_switching
};

draw_controller();

element = undefined;

text_name_x = width / 2;
text_name_y = height - 100;

slider = UISlider(0, function(value) {
	var scale_max = element.scale_max - 1; // 1 - it is scale_min
	element.scale = 1 + scale_max * value;
})
slider_position_x = text_name_x - slider.length / 2;
slider_position_y = text_name_y + 24;

text_size = translate_get("Menu.Settings.MobileControls.Size");
text_size_position_x = slider_position_x - 10;
text_size_position_y = slider_position_y - 7;


// Virtual Buttons
var buttons = global.__ui_virtual_buttons_instance.get_customizable_buttons();

for (var i = 0; i < array_length(buttons); i++) {
	array_push(controls, SettingsMobileButton(id, buttons[i].instance.UI.image, buttons[i].name));
}
array_push(controls, SettingsMobileControl(id, controllers_switching  ))
// Special attack
array_push(controls, SettingsMobileCommonButton(id, spr_special_attack_cross, "SpecialAction"));

elements_reset = function () {
	controls[@ 0] = -1;	
	
	draw_controller()
	
	var buttons = global.__ui_virtual_buttons_instance.get_customizable_buttons();

	for (var i = 0; i < array_length(buttons); i++) {
	array_push(controls, SettingsMobileButton(id, buttons[i].instance.UI.image, buttons[i].name));
}
	
	array_push(controls, SettingsMobileControl(id, controllers_switching))
	// Special attack
	array_push(controls, SettingsMobileCommonButton(id, spr_special_attack_cross, "SpecialAction"));
};
