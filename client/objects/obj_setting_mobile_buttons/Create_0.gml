var width = display_get_gui_width();
var height = display_get_gui_height();

button = new UITextButton(0, translate_get("Menu.Settings.MobileControls.Ready"))
	.set_padding(5)
	.set_on_press(function() {
		obj_setting_mobile.goto_menu();
	});

button_position_x = width - button.width;
button_position_y = height - 10;