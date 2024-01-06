function SettingsMobileArrows(controller) constructor {
	self.controller = controller;
	name = "Arrows";
	arrows = controller.controllers[control_input_mode.ui_arrows];
	
	sprite = spr_ui_controls_rectangle;
	
	static draw = function(position_x, position_y) {
		arrows.draw(position_x, position_y);
	}
}