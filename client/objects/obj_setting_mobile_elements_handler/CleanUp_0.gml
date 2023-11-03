for (var i = 0; i < array_length(controls); i++) {
	controls[i].save_data();
}

var controller = global.__ui_controls_instance;
if (controller.controllers_index == control_input_mode.ui_arrows) {
	
	
for (var i = 0; i < array_length(controls_arrows); i++) {	
	controls_arrows[i].save_data();	
	};
};
