button = new UITextButton(0, translate_get("Pause.Title"))
	.set_bind_input(input.back)
	.set_padding(5)
	.set_on_press(function() {
		instance_create_one(obj_ui_panel_menu_fight);
	});