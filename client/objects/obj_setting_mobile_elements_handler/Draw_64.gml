for (var i = 0; i < array_length(controls); i++) {
	controls[i].draw();
};

var controller = global.__ui_controls_instance;
if (controller.controllers_index == control_input_mode.ui_arrows) {
	
for (var i = 0; i < array_length(controls_arrows); i++) {	
	controls_arrows[i].draw();	
	};
};
 
if (element == undefined) exit;

// Text name
draw_set_font(global._font_main_determination);
draw_set_halign(fa_center);

draw_text(text_name_x, text_name_y, element.display_name);

// Siler
slider.draw(slider_position_x, slider_position_y);

// Text Size
draw_set_font(global._font_main_determination);
draw_set_halign(fa_right);

draw_text(text_size_position_x, text_size_position_y, text_size);
